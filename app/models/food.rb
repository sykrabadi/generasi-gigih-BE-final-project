class Food < ApplicationRecord
  has_many :order_details
  has_many :orders, :through => :order_details
  
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than: 0.01}

  def category_to_array
    return select(:category)
  end
end
