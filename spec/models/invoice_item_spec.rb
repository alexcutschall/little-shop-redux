RSpec.describe 'InvoiceItem model' do
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
  context 'Class methods' do
    it '.total_price' do
      InvoiceItem.create(item_id: 2, invoice_id: 5 , quantity: 6, unit_price: 10)
      InvoiceItem.create(item_id: 2, invoice_id: 9, quantity: 6, unit_price: 10)
      InvoiceItem.create(item_id: 1, invoice_id: 5, quantity: 6, unit_price: 10)
      InvoiceItem.create(item_id: 2, invoice_id: 90, quantity: 6, unit_price: 10)

      expect(InvoiceItem.total_price).to eq(240)
    end
  end
  context 'Instance methods' do
    it 'find_title' do
      inv_item = InvoiceItem.create(item_id: 1, invoice_id: 5 , quantity: 6, unit_price: 10)
      Item.create(title: 'Thing', description: 'x', price: 6, image: 'x', merchant_id: 9)

      expect(inv_item.find_title(1)).to eq('Thing')
    end
  end
end
