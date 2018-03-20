# Defines Item class
class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :merchant_id, presence: true
  has_many :invoice_items
  has_many :invoicesitem

  def self.average_price
    (average(:price) / 100).to_f.round(2)
  end

  def self.total_count
    Item.all.count
  end

  def self.oldest
  end

  def self.newest
  end
end
