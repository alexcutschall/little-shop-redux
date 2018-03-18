# Defines Item class
class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  has_many :invoice_items

  def total_price
    invoice_items.reduce(0) do |total, invoice_item|
      total + invoice_item.unit_price
    end
  end

  def unit_price
    price = invoice_items.reduce(0) do |total, invoice_item|
      total + (invoice_item.unit_price / 100)
    end
    (price / 100).to_f
  end
end
