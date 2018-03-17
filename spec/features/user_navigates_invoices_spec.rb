describe 'User Navigates Invoices Page' do
  context 'user visits invoice index page' do
    it 'should contain invoice info' do
      Invoice.new(merchant_id: 1, customer_id: 3, status: 'pending')

      click_link '1'
      expect(page).to have_content('Pending')
    end
  end
end
