RSpec.describe Item do
  context 'Validate fields' do
    it 'is invalid to not have a title' do
      item = Item.new(title: '', description: 'x', price: 12, image: 'x')

      expect(item).to be_invalid
    end

    it 'is invalid to not have a description' do
      item = Item.new(title: 'x', description: '', price: 12, image: 'x')

      expect(item).to be_invalid
    end

    it 'is invalid to not have a price' do
      item = Item.new(title: 'x', description: 'x', price: '', image: 'x')

      expect(item).to be_invalid
    end

    it 'is invalid to not have an image' do
      item = Item.new(title: 'x', description: 'x', price: 12, image: '')

      expect(item).to be_invalid
    end
  end
end
