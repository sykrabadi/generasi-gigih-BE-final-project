class Order < ApplicationRecord
  has_many :order_details
  has_many :foods, :through => :order_details
  
  validates :order_date, presence: true
  validates :total_price, presence: true, numericality: true
  validates :payment_status, presence: true

end
