class DropAllTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :invoices
    drop_table :merchants
    drop_table :items
  end
end
