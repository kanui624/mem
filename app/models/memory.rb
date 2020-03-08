class Memory < ApplicationRecord
  belongs_to :user
  # has_many :photos
  geocoded_by :location
  after_validation :geocode

  validates :mem, presence: true, length: {maximum: 30, minimun: 3}
  validates :mood, presence: true, length: {maximum: 30, minimun: 3}
  validates :thoughts, presence: true
  validates :date, presence: true
  validates :location, presence: true, length: {maximum: 30, minimun: 3}
end