class RenameEmaiToEmailInCustomer < ActiveRecord::Migration[7.0]
  def change
    rename_column :customers, :emai, :email
  end
end
