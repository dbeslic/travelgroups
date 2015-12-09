class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|

      t.string :name

      t.integer :user_id

      t.integer :min_group

      t.integer :max_group

      t.string :description

      t.date :start_date

      t.date :end_date


      t.timestamps

    end

  end
end
