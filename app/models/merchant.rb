class Merchant < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :invoices
  has_many :items

  def average_price
    items.average_price
  end

  def total_price
    items.total_price
  end

  def self.top_seller
  end 
end
