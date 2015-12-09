class AddCountryToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :country, :string
  end
end
