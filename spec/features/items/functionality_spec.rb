RSpec.describe Item, type: :feature do
  context 'Database functionality' do
    context 'Create New Item' do
      it 'has correct title' do
        Merchant.create(name: 'Vendor')
        visit '/items/new'
        select('Vendor', :from => 'Merchants')
        fill_in('item[title]', with: 'New Things Title')
        click_button('Create Item')

        expect(page).to have_content('New Things Title')
      end
    end
  end
end
