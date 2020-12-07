class Genre < ApplicationRecord
  has_many :game_genres
  has_many :games, through: :game_genres

  def name
    genre_name
  end
end
