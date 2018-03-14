class Merchant < ActiveRecord::Base
  validates :id, presence: true
  validates :name, presence: true
end
