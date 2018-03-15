# Removes customer id column
class RemoveCustomerIdFromInvoices < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoices, :customer_id
  end
end
