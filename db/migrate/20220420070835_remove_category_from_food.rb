class RemoveCategoryFromFood < ActiveRecord::Migration[7.0]
  def change
    remove_reference :foods, :category, foreign_key: true, index: false
  end
end
