RSpec.describe InvoiceItem do
  describe "Class Methods" do
    it ".total_price" do
      InvoiceItem.create!(item_id: 263519844, invoice_id: 900 , quantity: 6, unit_price: 10)

      expect(InvoiceItem.total_price).to eq(60)
    end
    it ".quantity" do
      InvoiceItem.create!(item_id: 263519844, invoice_id: 900 , quantity: 6, unit_price: 10)

      expect(InvoiceItem.quantity).to eq(6)
    end
    it ".unit_price" do
      InvoiceItem.create!(item_id: 263519844, invoice_id: 900 , quantity: 6, unit_price: 10)

      expect(Invoice.Item.unit_price).to eq(10)
    end
  end 
end
