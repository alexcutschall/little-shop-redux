RSpec.describe 'Homepage' do
  context 'user can go to all merchant pages' do
    it 'takes user to merchant page' do
      visit '/'
      click_button 'Merchants'

      expect(page).to have_content('Merchants')
    end
  end
  context 'user can go to all invoice pages' do
    it 'takes user to invoices page' do
      visit '/merchants'
      click_button 'Invoices'

      expect(page).to have_content('Invoices')
    end
  end
  context 'user can go to all item pages' do
    it 'takes user to items page' do
      visit '/merchants'
      click_button 'Items'

      expect(page).to have_content('Items')
    end
  end
end
