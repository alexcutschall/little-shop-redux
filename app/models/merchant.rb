class Merchant < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :invoices
  has_many :items

  def average_price
    price = items.reduce(0) do |total, item|
      total + (item.total_price / 100)
    end
    ((price / items.count) / 100).to_f.to_s
  end

  def total_price
    items.reduce(0) do |total, item|
      total + item.unit_price
    end.to_f.to_s
  end

  def self.most_items
    
  end
end
