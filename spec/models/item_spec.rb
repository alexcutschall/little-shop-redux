RSpec.describe Item do
  describe 'Validate fields' do
    it 'is invalid to not have a title' do
      item = Item.new(description: '', price: 12, image: '')

      expect(item).to be_invalid
    end
    it 'is invalid to not have a description' do
      item = Item.new(title: '', price: 12, image: '')

      expect(item).to be_invalid
    end
    it 'is invalid to not have a price' do
      item = Item.new(title: '', description: '', image: '')

      expect(item).to be_invalid
    end
    it 'is invalid to not have an image' do
      item = Item.new(title: '', description: '', price: 12)

      expect(item).to be_invalid
    end
  end
end
