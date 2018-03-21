describe Invoice, type: :feature do
  context 'Page navigation' do
    context 'Index page' do
      it 'has links on invoice id numbers' do
        m1 = Merchant.create(id: 1, name: 'ABC')
        m1.invoices.create(status: 'pending')
        m2 = Merchant.create(id: 2, name: 'DBC')
        m2.invoices.create(status: 'pending')
        m3 = Merchant.create(id: 3, name: 'XYZ')
        m3.invoices.create(status: 'pending')
        visit '/invoices'

        expect(page).to have_text('pending')
        expect(page).to have_link('2', href: '/invoices/2')
        expect(page).to have_link('3', href: '/invoices/3')
      end
      it 'takes user to an invoice page when you click the link' do
        m1 = Merchant.create!(id: 1, name: 'DBC')
        m1.invoices.create(status: 'pending')

        visit '/invoices'
        click_link 'pending'

        expect(current_path).to eq('/invoices/1')
      end
    end
    context 'Show page' do
      it 'takes user to edit page' do
        m1 = Merchant.create(id: 1, name: 'DBC')
        m1.invoices.create(status: 'pending')

        visit '/invoices/1'
        click_button 'edit'

        expect(current_path).to eq('/invoices/1/edit')
      end

      it 'should delete an item when you click the delete button' do
        Invoice.create(merchant_id: 5555, status: 'pending')

        visit '/invoices'

        expect(page).to have_text('pending')

        click_button 'delete'

        expect(page).to_not have_text('pending')
      end
    end
  end
end
