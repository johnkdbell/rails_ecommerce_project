class Game < ApplicationRecord
  has_one_attached :image

  belongs_to :platform
  has_many :ordered_games
  has_many :orders, through: :ordered_games
  accepts_nested_attributes_for :ordered_games, allow_destroy: true

  paginates_per 8

  validates :name, presence: true, uniqueness: true
  validates :release_date, :genre, :developer, presence: true
  validates :price, presence: true, numericality: true
end
