class User < ActiveRecord::Base
  has_many :bathrooms
  has_many :comments
  has_many :ratings
  validates :username, presence: true, uniqueness: true
  has_secure_password
end
