class Memory < ApplicationRecord
  belongs_to :user
  geocoded_by :location
  after_validation :geocode

  validates :title, presence: true  
end
