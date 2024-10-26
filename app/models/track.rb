class Track < ApplicationRecord
  belongs_to :artist
  has_and_belongs_to_many :genre # many to many relationship

  validates :name, presence: true, uniqueness: true
  validates :duration, numericality: { only_integer: true }
end
