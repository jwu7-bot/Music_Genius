class Track < ApplicationRecord
  has_and_belongs_to_many :genres # many to many relationship
  belongs_to :artist

  validates :name, presence: true, uniqueness: true
  validates :duration, numericality: { only_integer: true }
end
