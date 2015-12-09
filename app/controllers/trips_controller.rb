require 'open-uri'
require 'unirest'

# Unirest gem: I might use this to put RESTCountry API info, using mashable key

class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @commit = Commit.new
  end

  def show
    @trip = Trip.find(params[:id])

    @country_name = @trip.country
    @url_safe_country_name = URI.encode(@country_name)
    @url_gmaps = "https://maps.googleapis.com/maps/api/geocode/json?address=" +@url_safe_country_name
    @parsed_data = JSON.parse(open(@url_gmaps).read)
    # Geography data from Google, parsed from JSON to ruby

    @latitude = @parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = @parsed_data["results"][0]["geometry"]["location"]["lng"]

    @url_2 = "https://api.forecast.io/forecast/0ad9a369db64bb5a9f355ac6df79153c/#{@latitude},#{@longitude}"
    @parsed_data_2 = JSON.parse(open(@url_2).read)
    # Weather data parsed from JSON to Ruby

    @current_summary = @parsed_data_2["currently"]["summary"]
    @current_temperature = @parsed_data_2["currently"]["temperature"]
    @today_low = @parsed_data_2["daily"]["data"][0]["temperatureMin"]
    @today_high = @parsed_data_2["daily"]["data"][0]["temperatureMax"]

    @summary_of_next_several_hours = @parsed_data_2["hourly"]["summary"]

    @summary_of_next_several_days = @parsed_data_2["daily"]["summary"]

    @tomorrow_summary = @parsed_data_2["daily"]["data"][2]["summary"]
    @tomorrow_low = @parsed_data_2["daily"]["data"][2]["temperatureMin"]
    @tomorrow_high = @parsed_data_2["daily"]["data"][2]["temperatureMax"]


# Country info API from REST
# These code snippets use an open-source library. http://unirest.io/ruby

    # Request and parse country data via Unirest and REST Country API

    @response = Unirest.get "https://restcountries-v1.p.mashape.com/name/#{@url_safe_country_name}",
    headers:{"X-Mashape-Key" => "w0xJ26tPlkmshqr5L2ks8E7XEmk1p1ycwVOjsnnA4LYA37tCNH",
      "Accept" => "application/json"}

      @raw_country_data = @response.raw_body
      @parsed_country_data_manual = JSON.parse(@raw_country_data)

      @parsed_country_data = @response.body

    # More info on unirest here http://unirest.io/ruby

    @country_name_full = @parsed_country_data_manual[0]["name"]
    @capital_city = @parsed_country_data_manual[0]["capital"]
    @country_name_native = @parsed_country_data_manual[0]["nativeName"]
    @population = @parsed_country_data_manual[0]["population"]
    @currencies = @parsed_country_data_manual[0]["currencies"][0]
    @languages = @parsed_country_data_manual[0]["languages"][0]
    @calling_codes = @parsed_country_data_manual[0]["callingCodes"][0]
    @sub_region = @parsed_country_data_manual[0]["subregion"]
    @time_zones = @parsed_country_data_manual[0]["timezones"]


  end


  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new

    @trip.name = params[:name]

    @trip.user_id = params[:user_id]

    @trip.min_group = params[:min_group]

    @trip.max_group = params[:max_group]

    @trip.description = params[:description]

    @trip.start_date = params[:start_date]

    @trip.end_date = params[:end_date]

    @trip.country = params[:country]

    @trip.image_url = params[:image_url]


    if @trip.save
      redirect_to "/trips", :notice => "Trip created successfully."
    else
      render 'new'
    end

  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])


    @trip.name = params[:name]

    @trip.user_id = params[:user_id]

    @trip.min_group = params[:min_group]

    @trip.max_group = params[:max_group]

    @trip.description = params[:description]

    @trip.start_date = params[:start_date]

    @trip.end_date = params[:end_date]



    if @trip.save
      redirect_to "/trips", :notice => "Trip updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @trip = Trip.find(params[:id])

    @trip.destroy


    redirect_to "/trips", :notice => "Trip deleted."

  end
end

