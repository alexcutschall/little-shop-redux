describe Invoice, type: :feature do
  context 'Page navigation' do
    context 'Index page' do
      it 'shows the word invoices' do
        visit '/invoices'

        expect(page).to have_content('Invoices')
      end
      it 'shows all the invoices' do
        Invoice.create(merchant_id: 1, status: 'pending')
        Invoice.create(merchant_id: 30, status: 'delivered')
        Invoice.create(merchant_id: 35, status: 'shipped')
        visit '/invoices'

        expect(page).to have_content('pending')
        expect(page).to have_content('delivered')
        expect(page).to have_content('shipped')
      end
      it 'contains invoice links by id' do
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
    context 'Show page' do
      it 'should have invoice information' do
        i1 = Invoice.create(merchant_id: 30, status: 'pending')
        i2 = Invoice.create(merchant_id: 1, status: 'delivered')
        Merchant.create(name: 'First')

        visit '/invoices/2'

        expect(page).to have_text('Invoice: 2')
        expect(page).to have_text(i2.merchant.name)
        expect(page).to have_text(i2.status.capitalize)
      end
      it 'should have edit and delete buttons' do
        Invoice.create(merchant_id: 1, status: 'pending')
        Invoice.create(merchant_id: 30, status: 'delivered')
        visit '/invoices/2'

        page.has_button?('edit')
        page.has_button?('delete')
      end
      it 'should take you to an edit page when you click edit button' do
      end
      it 'should take you to a page to confirm that you want to delete the item' do
      end
    end
  end
end
