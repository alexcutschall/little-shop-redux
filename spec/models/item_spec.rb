RSpec.describe Item do
  context 'Validate fields' do
    it 'is invalid to not have a title' do
      item = Item.new(title: '', description: 'x', price: 12, image: 'x', merchant_id: 9)

      expect(item).to be_invalid
    end
    it 'is invalid to not have a description' do
      item = Item.new(title: 'x', description: '', price: 12, image: 'x', merchant_id: 9)

      expect(item).to be_invalid
    end
    it 'is invalid to not have a price' do
      item = Item.new(title: 'x', description: 'x', price: '', image: 'x', merchant_id: 9)

      expect(item).to be_invalid
    end
    it 'is invalid to not have an image' do
      item = Item.new(title: 'x', description: 'x', price: 12, image: '', merchant_id: 9)

      expect(item).to be_invalid
    end
    it 'is invalid to not have a merchant id' do
      item = Item.new(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: '')

      expect(item).to be_invalid
    end
  end
  context 'Class methods' do
    it '.total_count' do
      Item.create(title: 'Thing', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x', merchant_id: 2)
      Item.create(title: 'Something else', description: 'x', price: 12, image: 'x', merchant_id: 3)
      Item.create(title: 'Anything', description: 'x', price: 12, image: 'x', merchant_id: 4)
      Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x', merchant_id: 5)

      expect(Item.total_count).to eq(5)
    end
    it '.average_price' do
      Item.create(title: 'Thing', description: 'x', price: 800, image: 'x', merchant_id: 1)
      Item.create(title: 'Another thing', description: 'x', price: 900, image: 'x', merchant_id: 2)
      Item.create(title: 'Something else', description: 'x', price: 1000, image: 'x', merchant_id: 3)
      Item.create(title: 'Anything', description: 'x', price: 1100, image: 'x', merchant_id: 4)
      Item.create(title: 'Stuff', description: 'x', price: 1200, image: 'x', merchant_id: 5)

      expect(Item.average_price).to eql(10.00)
    end
    it '.newest' do
      Item.create(title: 'Thing', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x', merchant_id: 2)
      Item.create(title: 'Something else', description: 'x', price: 12, image: 'x', merchant_id: 3)
      Item.create(title: 'Anything', description: 'x', price: 12, image: 'x', merchant_id: 4)
      Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x', merchant_id: 5)

      expect(Item.newest.title).to eql('Stuff')
    end
    it '.oldest' do
      Item.create(title: 'Thing', description: 'x', price: 12, image: 'x', merchant_id: 1)
      Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x', merchant_id: 2)
      Item.create(title: 'Something else', description: 'x', price: 12, image: 'x', merchant_id: 3)
      Item.create(title: 'Anything', description: 'x', price: 12, image: 'x', merchant_id: 4)
      Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x', merchant_id: 5)
      visit '/items-dashboard'

      expect(Item.oldest.title).to eql('Thing')
    end
  end
end
