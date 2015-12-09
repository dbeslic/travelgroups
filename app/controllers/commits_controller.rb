class CommitsController < ApplicationController
  def index
    @commits = Commit.all
  end

  def show
    @commit = Commit.find(params[:id])
  end

  def new
    @commit = Commit.new
  end

  def create
    @commit = Commit.new

    @commit.trip_id = params[:trip_id]

    @commit.user_id = params[:user_id]


    if @commit.save
      redirect_to "/commits", :notice => "Commit created successfully."
    else
      render 'new'
    end

  end

  def edit
    @commit = Commit.find(params[:id])
  end

  def update
    @commit = Commit.find(params[:id])


    @commit.trip_id = params[:trip_id]

    @commit.user_id = params[:user_id]

    if @commit.save
      redirect_to "/commits", :notice => "Commit updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @commit = Commit.find(params[:id])

    @commit.destroy


    redirect_to "/commits", :notice => "Commit deleted."

  end
end
