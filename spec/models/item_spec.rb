RSpec.describe Item do
  describe 'Validate fields' do
    it 'is invalid to not have a title' do
      item = Item.new(description: 'jhg', price: 12, image: 'jhkjh')

      expect(item).to be_invalid
    end

    it 'is invalid to not have a description' do
      item = Item.new(title: ',jh', price: 12, image: 'jlhkjh')

      expect(item).to be_invalid
    end

    it 'is invalid to not have a price' do
      item = Item.new(title: 'khkjh', description: 'jhjg', image: 'mmnb')

      expect(item).to be_invalid
    end

    it 'is invalid to not have an image' do
      item = Item.new(title: 'jgf', description: 'g', price: 12)

      expect(item).to be_invalid
    end
  end
end
