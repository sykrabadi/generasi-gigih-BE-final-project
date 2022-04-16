class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.float :total_price
      t.string :payment_status

      t.timestamps
    end
  end
end
