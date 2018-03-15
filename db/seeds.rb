require 'csv'
require './app/models/invoice'
require './app/models/merchant'
require './app/models/item'

CSV.foreach(
  './data/invoices.csv',
  headers: true,
  header_converters: :symbol
) { |info| Invoice.create(info.to_h) }

CSV.foreach(
  './data/merchants.csv',
  headers: true,
  header_converters: :symbol
) { |info| Merchant.create(info.to_h) }

CSV.foreach(
  './data/items.csv',
  headers: true,
  header_converters: :symbol
) { |info| Item.create(info.to_h) }

# def load_csv(filepath, type)
#   CSV.foreach(filepath, headers: true, header_converters: :symbol) do |info|
#
#
# end
