class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :bathroom
  validates_inclusion_of :number , in: 0..10
end
