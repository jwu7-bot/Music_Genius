class Track < ApplicationRecord
  belongs_to :artist
  belongs_to :genre

  validates :name, presence: true, uniqueness: true
  validates :duration, numericality: { only_integer: true }
end
