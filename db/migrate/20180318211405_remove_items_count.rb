class RemoveItemsCount < ActiveRecord::Migration[5.1]
  def change
    remove_column :merchants, :item_count, :integer
  end
end
