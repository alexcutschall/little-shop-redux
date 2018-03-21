RSpec.describe InvoiceItem do
  context 'Validate fields' do
    it 'is invalid to not have an item_id' do
      item = InvoiceItem.new(item_id: '', invoice_id: 1, quantity: 1, unit_price: 1)

      expect(item).to be_invalid
    end
    it 'is invalid to not have an invoice_id' do
      item = InvoiceItem.new(item_id: 1, invoice_id: '', quantity: 1, unit_price: 1)

      expect(item).to be_invalid
    end
    it 'is invalid to not have a quantity' do
      item = InvoiceItem.new(item_id: 1, invoice_id: 1, quantity: '', unit_price: 1)

      expect(item).to be_invalid
    end
    it 'is invalid to not have a unit_price' do
      item = InvoiceItem.new(item_id: 1, invoice_id: 1, quantity: 1, unit_price: '')

      expect(item).to be_invalid
    end
  end
  context 'Class Methods' do
    it '.total_price' do
      item = InvoiceItem.create(item_id: 263519844, invoice_id: 900 , quantity: 6, unit_price: 10)

      expect(item.total_price).to eq(60)
    end
    it '.quantity' do
      item = InvoiceItem.create(item_id: 263519844, invoice_id: 900 , quantity: 6, unit_price: 10)

      expect(item.quantity).to eq(6)
    end
    it '.unit_price' do
      item = InvoiceItem.create(item_id: 263519844, invoice_id: 900 , quantity: 6, unit_price: 10)

      expect(item.unit_price).to eq(10)
    end
  end
end
