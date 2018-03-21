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
      Merchant.create(name: 'Second')
      Item.create(title: 'Thing2', description: 'x', price: 12, image: 'x', merchant_id: 2)
      Merchant.create(name: 'Third')
      Item.create(title: 'Thing3', description: 'x', price: 12, image: 'x', merchant_id: 3)

      expect(Merchant.most_items.name).to eql('First')
    end
    it '.highest_priced_item' do
      Merchant.create(name: 'First')
      Item.create(title: 'Thing', description: 'x', price: 1200, image: 'x', merchant_id: 1)
      Merchant.create(name: 'Second')
      Item.create(title: 'Thing2', description: 'x', price: 120, image: 'x', merchant_id: 2)
      Merchant.create(name: 'Third')
      Item.create(title: 'Thing3', description: 'x', price: 12, image: 'x', merchant_id: 3)

      expect(Merchant.highest_priced_item.name).to eql('First')
    end
  end
end
