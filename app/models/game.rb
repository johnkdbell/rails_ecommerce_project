class Game < ApplicationRecord
  belongs_to :platform

  has_many :ordered_games
  has_many :orders, through: :ordered_games

  validates :name, presence: true, uniqueness: true
  validates :release_date, :genre, :developer, presence: true
  validates :price, presence: true, numericality: true,
            :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }

end
