require 'csv'
require './app/models/invoice'

CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |info|
  Invoice.create(info.to_h)
end
