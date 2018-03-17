describe 'User Navigates Invoices Page' do
  context 'user visits invoice index page' do
    it 'should contain invoice info' do
<<<<<<< HEAD
      Invoice.new(merchant_id: 1, customer_id: 3, status: 'pending')

      click_link '1'
      expect(page).to have_content('Pending')
    end
  end
end
=======
      visit '/invoices'

      expect(page).to have_content('Invoices')
    end

    it 'should contain invoice links by id' do
      Invoice.create(merchant_id: 1, status: 'pending')
      Invoice.create(merchant_id: 30, status: 'delivered')
      Invoice.create(merchant_id: 35, status: 'shipped')

      visit '/invoices'

      expect(page).to have_text('pending')
      expect(page).to have_link('2', href: '/invoices/2')
      expect(page).to have_link('3', href: '/invoices/3')
    end

    it 'should redirect to an invoice page when you click the link' do
      Invoice.create(merchant_id: 1, status: 'pending')

      visit '/invoices'
      click_link '1'

      expect(page).to have_text('Invoice ID')
    end
  end

  context 'user visits specific invoice page' do
    it 'should have that invoice information' do
      Invoice.create(merchant_id: 1, status: 'pending')
      Invoice.create(merchant_id: 30, status: 'delivered')

      visit '/invoices/2'

      expect(page).to have_text('Invoice ID: 2')
      expect(page).to have_text('Merchant ID: 30')
      expect(page).to have_text('Status: delivered')
    end

    it 'should have edit and delete buttons' do
      Invoice.create(merchant_id: 1, status: 'pending')
      Invoice.create(merchant_id: 30, status: 'delivered')

      visit '/invoices/2'

      page.has_button?('Edit')
      page.has_button?('Delete')
    end

    it 'should take you to an edit page when you click edit button' do

    end

    it 'should take you to a page to confirm that you want to delete the item' do

    end
  end
end

>>>>>>> 2d835362fc6bf0e76034cd710dc7e5cfc634cecc
