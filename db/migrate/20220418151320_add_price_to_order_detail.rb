class AddPriceToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :price, :float
  end
end
