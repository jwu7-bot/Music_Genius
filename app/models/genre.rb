class Genre < ApplicationRecord
  has_and_belongs_to_many :tracks # many to many relationship

  validates :name, presence: true, uniqueness: true
end
