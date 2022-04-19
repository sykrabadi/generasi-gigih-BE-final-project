class Order < ApplicationRecord
  has_many :order_details
  has_many :foods, :through => :order_details
  
  validates :order_date, presence: true
  validates :payment_status, presence: true

  # At this state, total_price from Order table has been removed
  def total_price
    total = OrderDetail.where(order_id: self.id).sum("price * quantity")
    return total
  end

end
