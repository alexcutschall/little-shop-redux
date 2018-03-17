RSpec.describe Item, type: :feature do
  context 'Page navigation' do
    it 'shows all items' do
      visit '/items'

      expect(page).to have_content('Items')
    end
    it 'has a create new item link' do
      visit '/items'

      expect(page).to have_link('Create A New Item')
    end
    it 'takes you from index to new' do
      visit '/items'
      click_button 'Create a new item'

      expect(current_path).to eql('/items/new')
    end
    it 'has an item dashboard link' do
      visit '/items'

      expect(page).to have_link('Dashboard')
    end
  end
end
