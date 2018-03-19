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
end
