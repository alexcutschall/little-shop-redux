RSpec.describe Item, type: :feature do
  context 'Page content' do
    context 'Index page' do
      it 'says items on top of page' do
        visit '/items'

        expect(page).to have_content('Items')
      end
      it 'shows all the items' do
        Item.create(title: 'Thing', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Something else', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Anything', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x')
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
        Item.create(title: 'I\'m here', description: 'x', price: 12, image: 'x', merchant_id: 1)
        Merchant.create(name: 'x')
        visit '/items/1'

        expect(page).to have_content('I\'m here')
      end
      it 'shows item description' do
        Item.create(title: 'x', description: 'Ipsum lorum', price: 12, image: 'x', merchant_id: 1)
        Merchant.create(name: 'x')
        visit '/items/1'

        expect(page).to have_content('Ipsum lorum')
      end
      it 'shows item price' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
        Merchant.create(name: 'x')
        visit '/items/1'

        expect(page).to have_content('12')
      end
      it 'shows the item\'s merchant' do
        Item.create(title: 'Thing', description: 'does stuff', price: 12, image: 'URL', merchant_id: 1)
        Merchant.create(name: 'Merch name')
        visit '/items/1'

        expect(page).to have_content('Merch name')
      end
    end
    context 'New page' do
      it 'says new on top of page' do
          visit '/items/new'

          expect(page).to have_content('Create New Item')
        end
      it 'has a dropdown menu to select from known merchants' do
          Merchant.create(name: 'Bill')
          Merchant.create(name: 'Bob')
          Merchant.create(name: 'Bryan')
          visit 'items/new'

          expect(page).to have_select('Merchants', options: %w[Bill Bob Bryan])
        end
      it 'has a form for the new title' do
          visit '/items/new'

          expect(page).to have_selector("input[value='New Title Here']")
        end
      it 'has a form for the new description' do
          visit '/items/new'

          expect(page).to have_selector("input[value='New Description Here']")
        end
      it 'has a form for the new price' do
          visit '/items/new'

          expect(page).to have_selector("input[value='New Price Here']")
        end
      it 'has a form for the new image URL' do
          visit '/items/new'

          expect(page).to have_selector("input[value='www.example.com/image.jpg']")
        end
    end
    context 'Edit page' do
      it 'shows edit item title on top of page' do
        Item.create(title: 'Thing', description: 'does stuff', price: 12, image: 'URL', merchant_id: 1)

        visit '/items/1/edit'

        expect(page).to have_content('Edit Thing')
      end
    end
    context 'Dashboard' do
      it 'shows the total count of items' do
        Item.create!(title: 'Thing', description: 'x', price: 12, image: 'x')
        Item.create!(title: 'Another thing', description: 'x', price: 12, image: 'x')
        Item.create!(title: 'Something else', description: 'x', price: 12, image: 'x')
        Item.create!(title: 'Anything', description: 'x', price: 12, image: 'x')
        Item.create!(title: 'Stuff', description: 'x', price: 12, image: 'x')
        visit '/items-dashboard'

        expect(page).to have_content('Total Item Count')
        expect(page).to have_content('5')
      end
      it 'shows the average price of items' do
        Item.create(title: 'Thing', description: 'x', price: 8, image: 'x')
        Item.create(title: 'Another thing', description: 'x', price: 9, image: 'x')
        Item.create(title: 'Something else', description: 'x', price: 10, image: 'x')
        Item.create(title: 'Anything', description: 'x', price: 11, image: 'x')
        Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x')
        visit '/items-dashboard'

        expect(page).to have_content('Avg Price Per Item')
        expect(page).to have_content('10')
      end
      it 'shows the newest item' do
        Item.create(title: 'Thing', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Something else', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Anything', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x')
        visit '/items-dashboard'

        expect(page).to have_content('Item by Age')
        expect(page).to have_content('Newest')
        expect(page).to have_content('Stuff')
      end
      it 'shows the oldest item' do
        Item.create(title: 'Thing', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Another thing', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Something else', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Anything', description: 'x', price: 12, image: 'x')
        Item.create(title: 'Stuff', description: 'x', price: 12, image: 'x')
        visit '/items-dashboard'

        expect(page).to have_content('Oldest')
        expect(page).to have_content('Thing')
      end
    end
  end
end
