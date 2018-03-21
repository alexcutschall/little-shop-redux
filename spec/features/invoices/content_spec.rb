describe Invoice do
  context 'Page content' do
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
    end
    context 'Show page' do
      it 'should have that invoice information' do
        m1 = Merchant.create(id: 45, name: 'DBC')
        m1.invoices.create(status: 'pending')
        visit '/invoices/1'

        expect(page).to have_text('DBC')
        expect(page).to have_text('Pending')
      end

      it 'should have edit and delete buttons' do
        m1 = Merchant.create(id: 45, name: 'DBC')
        m1.invoices.create(status: 'pending')
        visit '/invoices/1'

        page.has_button?('edit')
        page.has_button?('delete')
      end
    end
  end
end
