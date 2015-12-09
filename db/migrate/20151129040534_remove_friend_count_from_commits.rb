class RemoveFriendCountFromCommits < ActiveRecord::Migration
  def change
        remove_column :commits, :friend_count
  end
end
