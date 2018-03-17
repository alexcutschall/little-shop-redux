RSpec.describe Item, type: :feature do
  context 'Page content' do
    context 'Index page' do
      it 'says items on top of page' do
        visit '/items'

        expect(page).to have_content('Items')
      end
      it 'shows all the items' do
        item1 = Item.create(title: 'Thing', description: 'x', price: 12, image: 'x')
        item2 = Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x')
        item3 = Item.create(title: 'Something else', description: 'x', price: 12, image: 'x')
        item4 = Item.create(title: 'Anything', description: 'x', price: 12, image: 'x')
        item5 = Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x')
        visit '/items'

        expect(page).to have_content('Thing')
        expect(page).to have_content('Another thing')
        expect(page).to have_content('Something else')
        expect(page).to have_content('Anything')
        expect(page).to have_content('Stuff')
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
      it 'shows the item\'s merchant' do
        item = Item.create(title: 'x', description: 'x', price: 12, image: 'x')
        merchant = Merchant.create(name: 'Merch name')
        visit '/items/1'

        expect(page).to have_content('Merch name')
      end
    end
  end
end
