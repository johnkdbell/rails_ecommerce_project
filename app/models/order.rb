class Order < ApplicationRecord
  has_many :ordered_games
  has_many :games, through: :ordered_games

  validates :total_price, presence: true
end
