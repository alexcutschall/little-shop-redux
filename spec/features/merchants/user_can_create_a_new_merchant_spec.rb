describe "Create a New Merchant" do
  context "user wants to create a new merchant" do
    it "should create a new merchant within the database" do
      visit '/merchants/new'

      fill_in 'merchant[name]', with: "Alex's Store"
      click_button 'Create'

      expect(current_path).to eq ('/merchants/1')
      expect(page).to have_content("Alex's Store")
      expect(Merchant.count).to eq(1)
    end
  end
end
