class Food < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :orders, :through => :order_details
  
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than: 0.01}
end
