class RepopulateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text    :title
      t.text    :description
      t.integer :price
      t.text    :image

      t.timestamps null: false
    end

    create_table :merchants do |t|
      t.text :name

      t.timestamps null: false
    end

    create_table  :invoices do |t|
      t.integer   :customer_id
      t.integer   :merchant_id
      t.text      :status

      t.timestamps null: false
    end
  end
end
