class OrderedGame < ApplicationRecord
  belongs_to :game
  belongs_to :order

  validates :quantity, presence: true
end
