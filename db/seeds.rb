require 'csv'
require './app/models/invoice'
require './app/models/merchant'
require './app/models/item'

CSV.foreach(
  './data/invoices.csv',
  headers: true,
  header_converters: :symbol
) do |info|
  Invoice.create(
    merchant_id: info[:merchant_id],
    status: info[:status]
  )
end

CSV.foreach(
  './data/merchants.csv',
  headers: true,
  header_converters: :symbol
) do |info|
  Merchant.create(
    name: info[:name]
  )
end

CSV.foreach(
  './data/items.csv',
  headers: true,
  header_converters: :symbol
) do |info|
  Item.create(
    title: info[:name],
    description: info[:description],
    price: info[:unit_price]
  )
end

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |info|
  Merchant.create(info.to_h)
end
