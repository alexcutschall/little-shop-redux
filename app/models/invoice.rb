# Defines an Invoice
class Invoice < ActiveRecord::Base
  validates :merchant_id, presence: true
  validates :status, presence: true

  # attr_reader :id, :merchant_id, :status
  #
  # def initialize(task_params)
  #   @id = task_params['id']
  #   @merchant_id = task_params['merchant_id']
  #   @status = task_params['status']
  # end
end
