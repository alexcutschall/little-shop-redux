describe Invoice, type: :feature do
  context 'Page navigation' do
    context 'Index page' do
      it 'has links on invoice id numbers' do
        Invoice.create(merchant_id: 1, status: 'pending')
        Invoice.create(merchant_id: 30, status: 'delivered')
        Invoice.create(merchant_id: 35, status: 'shipped')
        visit '/invoices'

        expect(page).to have_text('pending')
        expect(page).to have_link('2', href: '/invoices/2')
        expect(page).to have_link('3', href: '/invoices/3')
      end
      it 'takes user to an invoice page when you click the link' do
        Invoice.create(merchant_id: 1, status: 'pending')

        visit '/invoices'
        click_link '1'

        expect(page).to have_text('Invoice ID: 1')
        expect(page).to have_text('pending')
      end
    end
    context 'Show page' do
      it 'takes user to edit page' do
        Invoice.create(merchant_id: 1, status: 'pending')
        visit '/invoices/1'

        expect(current_path).to eq('/invoices/1/edit')
      end
      it 'takes user to confirmation page after pushing delete' do
      end
    end
  end
end
