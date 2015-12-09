class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|

      t.integer :trip_id

      t.integer :user_id

      t.integer :friend_count


      t.timestamps

    end

  end
end
