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
        Item.create(title: 'x', description: 'x', price: 12, image: 'x')
        visit '/items'

        expect(page).to have_link('x')
      end
      it 'takes you from index to show' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x')
        visit '/items'
        click_link 'x'

        expect(current_path).to eql('/items/1')
      end
    end
    context 'Show page' do
      it 'has an edit link' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x')
        visit 'items/1'

        expect(page).to have_link('Edit')
      end
      it 'takes you from show to edit' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x')
        visit 'items/1'
        click_link 'Edit'

        expect(current_path).to eql('/items/1/edit')
      end
      it 'has a delete link' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x')
        visit 'items/1'

        expect(page).to have_link('Delete')
      end
      it 'takes you from show to index after deleting' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x')
        visit 'items/1'
        click_link 'Delete'

        expect(current_path).to eql('/items')
      end
    end
  end
end
