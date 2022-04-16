class Order < ApplicationRecord
  validates :order_date, presence: true
  validates :total_price, presence: true, numericality: true
  validates :payment_status, presence: true
end
