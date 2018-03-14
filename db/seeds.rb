require 'csv'

invoices = CSV.foreach('../../data/invoices.csv', headers: true, header_converters: :symbol) do |info|
  invoice = Invoice.new info, self
  @items.push item
end
