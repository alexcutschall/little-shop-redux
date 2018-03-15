RSpec.describe Merchant do

  describe 'Validate fields' do
    it 'is invalid to not have a name' do
      merchant = Merchant.new(id: 12334105)

      expect(merchant).to_not be_valid
    end
  end
end
