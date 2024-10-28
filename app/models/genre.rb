class Genre < ApplicationRecord
  has_many :tracks # many to many relationship
  belongs_to :tracks

  validates :name, presence: true, uniqueness: true
end
