# Defines an Invoice
class Invoice < ActiveRecord::Base
  validates :merchant_id, presence: true
  validates :status, presence: true
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :merchant

  def self.unique_statuses
    distinct_invoices = Invoice.select(:status).distinct
    distinct_invoices.map(&:status)
  end

  def self.status_percentages
    Invoice.unique_statuses.each do |status|
      decimal = Invoice.where(status: status).count.to_f / Invoice.all.count
      (decimal * 100).round(1)
    end
  end
end
