class Bathroom < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :ratings
  validates :location, presence: true
  validates :description, presence: true
  validates :user, presence: true

  def has_not_been_rated_by_user(user_id)
   !self.ratings.find_by(user_id: user_id)
  end

  def average_rating
    self.ratings.average(:number)
  end
end
