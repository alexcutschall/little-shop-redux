RSpec.describe Merchant do
  describe "user is on the page merchant/items/invoices" do
    context "user can navigate around the website" do
      it "takes user to merchant page" do
        visit '/merchants'
        click_link 'Merchants'

        expect(page).to have_content("Merchants")
      end
      it "takes user to invoices page" do
        visit '/merchants'
        click_link 'Invoices'

        expect(page).to have_content("Invoices")
      end
      it "takes user to items page" do
        visit '/merchants'
        click_link 'Items'

        expect(page).to have_content("Items")
      end
    end
  end
end
