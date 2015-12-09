class Trip < ActiveRecord::Base

  belongs_to :user
  has_many :follows, :dependent => :destroy
  has_many :commits, :dependent => :destroy

  validates :name, :presence => true
  validates :country, :presence => true
  validates :user_id, :presence => true
  validates :min_group, :presence => true
  validates :max_group, :presence => true
  validates :description, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true

end
