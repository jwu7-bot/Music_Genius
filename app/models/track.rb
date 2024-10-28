class Track < ApplicationRecord
  has__many :genres # many to many relationship
  belongs_to :genres
  belongs_to :artist

  validates :name, presence: true, uniqueness: true
  validates :duration, numericality: { only_integer: true }
end
