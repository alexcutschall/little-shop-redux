# Defines an Invoice
class Invoice < ActiveRecord::Base
  validates :merchant_id, presence: true
  validates :status, presence: true
  belongs_to :merchant
end
