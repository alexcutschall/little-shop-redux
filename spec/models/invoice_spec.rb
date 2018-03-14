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
end
