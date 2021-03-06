RSpec.describe Item, type: :feature do
  context 'Page navigation' do
    context 'Index page' do
      it 'has a create new item link' do
        visit '/items'

        expect(page).to have_link('Create A New Item')
      end
      it 'takes user from index to new' do
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
      it 'takes user from index to show' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
        Merchant.create(name: 'x')
        visit '/items'
        click_link 'x'

        expect(current_path).to eql('/items/1')
      end
      it 'takes user from index to items-dashboard' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
        visit '/items'
        click_link 'Dashboard'

        expect(current_path).to eql('/items-dashboard')
      end
    end
    context 'Show page' do
      it 'has an edit link' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
        Merchant.create(name: 'x')
        visit 'items/1'

        expect(page).to have_button('edit')
      end
      it 'takes user from show to edit' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
        Merchant.create(name: 'x')
        visit 'items/1'
        click_button 'edit'

        expect(current_path).to eql('/items/1/edit')
      end
      it 'has a delete link' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
        Merchant.create(name: 'x')
        visit 'items/1'

        expect(page).to have_button('delete')
      end
      it 'takes user from show to index after deleting' do
        Item.create(title: 'x', description: 'x', price: 12, image: 'x', merchant_id: 1)
        Merchant.create(name: 'x')
        visit 'items/1'
        click_button 'delete'

        expect(current_path).to eql('/items')
      end
      it 'takes user to the item\'s merchant page' do
        Item.create(title: 'Thing', description: 'does stuff', price: 12, image: 'URL', merchant_id: 1)
        Merchant.create(name: 'Merch name')
        visit '/items/1'
        click_link 'Merch name'

        expect(current_path).to eql('/merchants/1')
      end
    end
    context 'New page' do
      it 'has a cancel link' do
        visit 'items/new'
        click_link 'Cancel'

        expect(current_path).to eql('/items')
      end
      it 'has a create item button' do
        visit 'items/new'
        click_button 'Create Item'

        expect(current_path).to eql('/items')
      end
    end
    context 'Edit page' do
      it 'has a cancel link' do
        Item.create(title: 'Thing', description: 'does stuff', price: 12, image: 'URL', merchant_id: 1)
        visit 'items/1/edit'
        click_link 'Cancel'

        expect(current_path).to eql('/items')
      end
      it 'has an edit item button' do
        Item.create(title: 'Thing', description: 'does stuff', price: 12, image: 'URL', merchant_id: 1)
        visit 'items/1/edit'
        click_button 'Update Item'

        expect(current_path).to eql('/items')
      end
    end
  end
end
