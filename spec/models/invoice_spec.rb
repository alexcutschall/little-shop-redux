RSpec.describe 'Invoice model' do
  describe 'Validate Fields' do
    it 'is invalid to not have a merchant_id' do
      invoice = Invoice.new(merchant_id: '', status: 'paid')

      expect(invoice).to_not be_valid
    end
    it 'is invalid to not have a status' do
      invoice = Invoice.new(merchant_id: 1, status: '')

      expect(invoice).to_not be_valid
    end
  end
  context 'Class methods' do
    it '.unique_statuses' do
      Invoice.create!(merchant_id: 1, status: 'paid')
      Invoice.create!(merchant_id: 1, status: 'shipped')
      Invoice.create!(merchant_id: 1, status: 'pending')
      Invoice.create!(merchant_id: 1, status: 'paid')

      expect(Invoice.unique_statuses).to eql('asdf')
    end
    it '.status_percentages' do
      Invoice.create!(merchant_id: 1, status: 'shipped')
      Invoice.create!(merchant_id: 1, status: 'paid')
      Invoice.create!(merchant_id: 1, status: 'pending')
      Invoice.create!(merchant_id: 1, status: 'paid')

      expect(Invoice.unique_statuses).to eql('asdf')
    end
  end
end
