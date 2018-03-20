RSpec.describe Merchant do
  context 'Validate fields' do
    it 'is invalid to not have a name' do
      merchant = Merchant.new(id: 12334105)

      expect(merchant).to_not be_valid
    end
  end
  context 'Class methods' do
    it '.most_items' do
      Merchant.create(name: 'First')
      Item.create(title: 'Thing', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'Something else', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'Anything', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Merchant.create(name: 'First')
      Item.create(title: 'Thing', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Merchant.create(name: 'First')
      Item.create(title: 'Thing', description: 'x', price: 12, image: 'x', merchant_id: 1)

      expect(Merchant.most_items).to eql('adf')
    end
  end
end
