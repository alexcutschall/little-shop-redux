RSpec.describe InvoiceItem do
  describe "Class Methods" do
    it ".total_price" do
      item = InvoiceItem.create(item_id: 263519844, invoice_id: 900 , quantity: 6, unit_price: 10)

      expect(item.total_price).to eq(60)
    end
    it ".quantity" do
      item = InvoiceItem.create(item_id: 263519844, invoice_id: 900 , quantity: 6, unit_price: 10)

      expect(item.quantity).to eq(6)
    end
    it ".unit_price" do
      item = InvoiceItem.create(item_id: 263519844, invoice_id: 900 , quantity: 6, unit_price: 10)

      expect(item.unit_price).to eq(10)
    end
  end
end
