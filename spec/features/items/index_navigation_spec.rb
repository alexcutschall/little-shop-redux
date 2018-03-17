RSpec.describe Item, type: :feature do
  context 'Page navigation' do
    it 'shows all items' do
      visit '/items'

      expect(page).to have_content('Items')
    end
    it 'takes you from index to new' do
      visit '/items'
      click_button 'Create a new item'

      expect(current_path).to have_xpath('/items/new')
    end
  end
end
