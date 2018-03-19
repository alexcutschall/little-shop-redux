# Defines Item class
class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  has_many :invoice_items

  def self.average_price
    (average(:price) / 100).to_f.round(2)
  end

  def self.total_price
    Item.sum("unit_price * quantity")
  end

  def unit_price
    price = invoice_items.reduce(0) do |total, invoice_item|
      total + (invoice_item.unit_price / 100)
    end
    (price / 100).to_f
  end
end
