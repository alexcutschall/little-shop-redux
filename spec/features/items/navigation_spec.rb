RSpec.describe Item, type: :feature do
  context 'Page navigation' do
    context 'Index page' do
      it 'has a create new item link' do
        visit '/items'

        expect(page).to have_link('Create A New Item')
      end
      it 'takes you from index to new' do
        visit '/items'
        click_link 'Create A New Item'

        expect(current_path).to eql('/items/new')
      end
      it 'has an item dashboard link' do
        visit '/items'

        expect(page).to have_link('Dashboard')
      end
      it 'has an item title link' do
        item = Item.new(title: 'x', description: 'x', price: 12, image: 'x')
        visit '/items'

        expect(page).to have_link('x')
      end
    end
  end
end
