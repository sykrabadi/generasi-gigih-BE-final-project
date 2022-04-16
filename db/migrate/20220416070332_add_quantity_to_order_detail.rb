class AddQuantityToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :quantitiy, :integer
  end
end
