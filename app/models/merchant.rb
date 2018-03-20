class Merchant < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :invoices
  has_many :items

  def average_price
    items.average_price
  end

  def total_price
    (items.sum(:price) / 100).to_f.round(2)
  end

  def self.most_items
    select("merchants.*, COUNT(items.id) AS item_count")
      .joins(:items)
      .group(:id)
      .order("item_count DESC")
      .first
  end

  def self.highest_priced_item
    joins(:items)
    .order("price").last
  end
end
