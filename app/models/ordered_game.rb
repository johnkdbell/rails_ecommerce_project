class OrderedGame < ApplicationRecord
  belongs_to :game
  belongs_to :order

  validates :purchase_price, :quantity, presence: true
end
