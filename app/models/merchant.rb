class Merchant < ActiveRecord::Base
  validates :merchant_id, presence: true
  validates :name, presence: true
end
