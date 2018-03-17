class Merchant < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :invoices
  has_many :items
end
