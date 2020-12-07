class Game < ApplicationRecord
  has_one_attached :image

  belongs_to :platform
  has_many :ordered_games
  has_many :orders, through: :ordered_games
  has_many :game_genres
  has_many :genres, through: :game_genres
  accepts_nested_attributes_for :ordered_games, allow_destroy: true
  accepts_nested_attributes_for :game_genres, allow_destroy: true

  paginates_per 8

  validates :name, presence: true, uniqueness: true
  validates :release_date, :developer, presence: true
  validates :price, presence: true, numericality: true

  def genres_list
    genres.map(&:name).join(", ")
    genres.map(&:name).join(", ")
  end
end
