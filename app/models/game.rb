class Game < ApplicationRecord
  has_one_attached :image

  belongs_to :platform

  validates :name, presence: true, uniqueness: true
  validates :release_date, :genre, :developer, presence: true
  validates :price, presence: true, numericality: true
end
