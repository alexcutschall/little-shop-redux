require 'csv'
require './app/models/invoice'
require './app/models/merchant'
require './app/models/item'
require './app/models/invoice_item'

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
    id: info[:id],
    name: info[:name]
  )
end

CSV.foreach(
  './data/items.csv',
  headers: true,
  header_converters: :symbol
) do |info|
  Item.create!(
    title: info[:name],
    description: info[:description],
    price: info[:unit_price],
    image: 'https://cakeconnection.com/wp-content/uploads/2017/11/CottonCandy.jpg',
    merchant_id: info[:merchant_id]
  )
end

CSV.foreach(
  './data/invoice_items.csv',
  headers: true,
  header_converters: :symbol) do |info|
    InvoiceItem.create(
      item_id: info[:item_id],
      invoice_id: info[:invoice_id],
      quantity: info[:quantity],
      unit_price: info[:unit_price])
end
