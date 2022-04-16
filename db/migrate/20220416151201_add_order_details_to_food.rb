class AddOrderDetailsToFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_details, :food, foreign_key: true
  end
end
