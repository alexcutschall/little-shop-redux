RSpec.describe Item do
  describe 'Validate fields' do
    it 'is invalid to not have a title' do
      item = Item.new(description: '', price: 12, image: '')
      expect(item).to_not be_valid
    end

    it 'is invalid to not have a description' do
      item = Item.new(title: '', price: 12, image: '')
      expect(item).to_not be_valid
    end

    it 'is invalid to not have a price' do
      item = Item.new(title: '', description: '', image: '')
      expect(item).to_not be_valid
    end

    it 'is invalid to not have an image' do
      item = Item.new(title: '', description: '', price: 12)
      expect(item).to_not be_valid
    end
  end

  describe 'Page navigation', :type => :feature do
    it 'shows all items' do
      visit '/items'

      expect(page).to have_content('Items')
    end
  end
end
