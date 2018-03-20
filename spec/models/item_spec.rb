RSpec.describe Item do
  context 'Validate fields' do
    it 'is invalid to not have a title' do
      item = Item.new(title: '',
                      description: 'x',
                      price: 12, image: 'x',
                      merchant_id: 9)

      expect(item).to be_invalid
    end

    it 'is invalid to not have a description' do
      item = Item.new(title: 'x',
                      description: '',
                      price: 12,
                      image: 'x',
                      merchant_id: 9)

      expect(item).to be_invalid
    end

    it 'is invalid to not have a price' do
      item = Item.new(title: 'x',
                      description: 'x',
                      price: '',
                      image: 'x',
                      merchant_id: 9)

      expect(item).to be_invalid
    end

    it 'is invalid to not have an image' do
      item = Item.new(title: 'x',
                      description: 'x',
                      price: 12,
                      image: '',
                      merchant_id: 9)

      expect(item).to be_invalid
    end

    it 'is invalid to not have a merchant id' do
      item = Item.new(title: 'x',
                      description: 'x',
                      price: 12,
                      image: 'x',
                      merchant_id: '')

      expect(item).to be_invalid
    end
  end
  context 'Class methods' do
    it '.total_count' do
      Item.create(title: 'Thing', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Something else', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Anything', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x')

      expect(Item.total_count).to eql(5)
    end
    it '.avg_price' do
      Item.create(title: 'Thing', description: 'x', price: 8, image: 'x')
      Item.create(title: 'Another thing', description: 'x', price: 9, image: 'x')
      Item.create(title: 'Something else', description: 'x', price: 10, image: 'x')
      Item.create(title: 'Anything', description: 'x', price: 11, image: 'x')
      Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x')

      expect(Item.avg_price).to eql(10)
    end
    it '.newest' do
      Item.create(title: 'Thing', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Something else', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Anything', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x')

      expect(Item.newest).to eql('Stuff')
    end
    it '.oldest' do
      Item.create(title: 'Thing', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Something else', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Anything', description: 'x', price: 12, image: 'x')
      Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x')
      visit '/items-dashboard'

      expect(Item.oldest).to eql('Thing')
    end
  end
end
