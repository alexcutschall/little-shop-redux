RSpec.describe Invoice do
  describe 'Validate Fields' do
    it 'is invalid to not have a merchant_id' do
      invoice = Invoice.new(status: 'paid')
      expect(invoice).to_not be_valid
    end

    it 'is invalid to not have a status' do
      invoice = Invoice.new(merchant_id: 1)
      expect(invoice).to_not be_valid
    end
  end

  # describe 'Clicking on Invoice Links' :type => :feature do
  #   it 'should click on invoice id link' do
  #     invoice = Invoice.new(merchant_id: 1, status: 'pending')
  #
  #     click_link
  #     expect(page).to have_content('')
  #   end
  # end
end
