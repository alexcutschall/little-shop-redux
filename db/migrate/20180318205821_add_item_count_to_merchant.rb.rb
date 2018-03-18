class AddItemCountToMerchant < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :item_count, :integer
  end
end
