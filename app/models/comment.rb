class Comment < ActiveRecord::Base
  belongs_to :bathroom
  belongs_to :user
  validates :text, presence: true
  validates :user, presence: true
  validates :bathroom, presence: true
end
