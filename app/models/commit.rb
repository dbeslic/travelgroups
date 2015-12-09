class Commit < ActiveRecord::Base

  belongs_to :user
  belongs_to :trip

  validates :user_id, :presence => true, :uniqueness => { :scope => :trip_id }
  validates :trip_id, :presence => true

end
