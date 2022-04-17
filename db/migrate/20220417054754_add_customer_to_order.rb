class AddCustomerToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :order, foreign_key: true
  end
end
