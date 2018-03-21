RSpec.describe 'Merchant model' do
  context 'Validate fields' do
    it 'is invalid to not have a name' do
      merchant = Merchant.new(id: 12334105)

      expect(merchant).to_not be_valid
    end
  end
  context 'Class methods' do
    it '.most_items' do
      Merchant.create(name: 'First')
      Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Merchant.create(name: 'Second')
      Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 2)
      Merchant.create(name: 'Third')
      Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 3)

      expect(Merchant.most_items.name).to eql('First')
    end
    it '.highest_priced_item' do
      Merchant.create(name: 'First')
      Item.create(title: 'x', description: 'x', price: 1200, image: 'x', merchant_id: 1)
      Merchant.create(name: 'Second')
      Item.create(title: 'x', description: 'x', price: 120, image: 'x', merchant_id: 2)
      Merchant.create(name: 'Third')
      Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 3)

      expect(Merchant.highest_priced_item.name).to eql('First')
    end
  end
  context 'Instance methods' do
    it 'average_price' do
      Item.create(title: 'x', description: 'x', price: 800, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 900, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 1000, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 1100, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 1200, image: 'x', merchant_id: 1)
      merch = Merchant.create(name: 'First')

      expect(merch.average_price).to eq(10.0)
    end
    it 'total_price' do
      Item.create(title: 'x', description: 'x', price: 200, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 300, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 1000, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 1200, image: 'x', merchant_id: 1)
      Item.create(title: 'x', description: 'x', price: 1300, image: 'x', merchant_id: 1)
      merch = Merchant.create(name: 'First')

      expect(merch.total_price).to eq(40.0)
    end
  end
end
