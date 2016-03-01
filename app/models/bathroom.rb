class Bathroom < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :ratings
  validates :location, presence: true
  validates :description, presence: true
  validates :user, presence: true
end
