class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :food

  validates :quantity, numericality: {only_integer: true}
end
