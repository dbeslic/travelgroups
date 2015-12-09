class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :trips, :dependent => :destroy
  has_many :follows, :dependent => :destroy
  has_many :commits, :dependent => :destroy

  validates :username, :presence => true, :uniqueness => true
  validates :avatar_url, :presence => true
  validates :about_me, :presence => true


end
