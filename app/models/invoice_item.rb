# Defines an Invoice Item
class InvoiceItem < ActiveRecord::Base
  validates :item_id, presence: true
  validates :invoice_id, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true
  belongs_to :invoices
  belongs_to :items

  def self.total_price
    total = InvoiceItem.all.map { |item| item.quantity * item.unit_price }
    (total.sum / 100).round(2)
  end

  def find_title(id)
    Item.find(id).title
  end

  def self.highest_unit_price
    order('unit_price DESC').first.invoice_id
  end

  def self.lowest_unit_price
    order('unit_price').first.invoice_id
  end

  def self.largest_quantity
    order('quantity DESC').first.invoice_id
  end

  def self.smallest_quantity
    order('quantity').first.invoice_id
  end
end
