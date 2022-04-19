class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :food

  validates :quantity, numericality: {only_integer: true}

  # At this state, total_price from Order table has been removed
  # def self.total_price(order)
  #   where("order_id = #{order.id}").sum("quantity * price")
  # end
end
