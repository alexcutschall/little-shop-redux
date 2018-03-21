RSpec.describe Item, type: :feature do
  context 'Database functionality' do
    context 'Create New Item' do
      it 'has correct title' do
        Merchant.create(name: 'Vendor')
        visit '/items/new'
        select('Vendor', from: 'item[merchant_id]')
        fill_in('item[title]', with: 'New Things Title')
        fill_in('item[description]', with: 'Desc')
        fill_in('item[price]', with: 1200)
        fill_in('item[image]', with: 'http:www.fake.com/')
        click_button('Create Item')

        expect(current_path).to eq('/items')
        expect(page).to have_link('New Things Title')
      end
    end
  end
end
