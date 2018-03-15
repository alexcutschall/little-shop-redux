# Defines Create Items Migration
class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text    :name
      t.text    :description
      t.integer :price
      t.text    :image

      t.timestamps null: false
    end
  end
end
