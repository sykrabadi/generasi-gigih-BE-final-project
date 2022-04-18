class Customer < ApplicationRecord
  has_many :orders
  
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  def self.check_order(customer_id)
    joins(:orders)
  end
end
