class RemoveTotalPriceFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :total_price, :float
  end
end
