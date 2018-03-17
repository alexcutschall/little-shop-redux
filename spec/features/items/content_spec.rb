RSpec.describe Item, type: :feature do
  context 'Page content' do
    context 'Index page' do
      it 'says items on top of page' do
        visit '/items'

        expect(page).to have_content('Items')
      end
    end
    context 'Show page' do
      it 'shows item title on top of page' do
        item = Item.create(title: 'I\'m here', description: 'x', price: 12, image: 'x')
        visit '/items/1'

        expect(page).to have_content('I\'m here')
      end
      it 'shows item description' do
        item = Item.create(title: 'x', description: 'Ipsum lorum', price: 12, image: 'x')
        visit '/items/1'

        expect(page).to have_content('Ipsum lorum')
      end
      it 'shows item price' do
        item = Item.create(title: 'x', description: 'x', price: 12, image: 'x')
        visit '/items/1'

        expect(page).to have_content('12')
      end
    end
  end
end
