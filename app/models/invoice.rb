# Defines an Invoice
class Invoice < ActiveRecord::Base
  validates :merchant_id, presence: true
  validates :status, presence: true
  has_many :invoice_items
  has_many :items
  belongs_to :merchant
end
