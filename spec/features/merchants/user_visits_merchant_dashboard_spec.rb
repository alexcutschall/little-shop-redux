describe "Merchant Dashboard" do
  context "user should see information" do
    it "should show most items merchant" do
      merchant_1 = Merchant.create(id: 1, name: "Denver Bouldering Club")
      merchant_1.items.create(title: "Climbing Shoes",
                            description: "Shoes for climbing",
                            price: 60,
                            image: "X",
                            merchant_id: 1)
      merchant_1.items.create(title: "Harness",
                            description: "Climbing Harness",
                            price: 100,
                            image: "X",
                            merchant_id: 1)

      merchant_2 = Merchant.create(id: 2, name: "Movement Gym")
      merchant_2.items.create(title: "Chalk Bag",
                            description: "A super cool one",
                            price: 150,
                            image: "X",
                            merchant_id: 2)
      merchant_2.items.create(title: "Belay Device",
                            description: "You can climb with friends now!",
                            price: 150,
                            image: "X",
                            merchant_id: 2)
      visit '/merchants-dashboard'

      expect(page).to have_content("Denver Bouldering Club")
    end
    it "should show most expensive item merchant" do
      merchant_1 = Merchant.create(id: 1, name: "Denver Bouldering Club")
      merchant_1.items.create(title: "Climbing Shoes",
                            description: "Shoes for climbing",
                            price: 60,
                            image: "X",
                            merchant_id: 1)
      merchant_1.items.create(title: "Harness",
                            description: "Climbing Harness",
                            price: 100,
                            image: "X",
                            merchant_id: 1)

      merchant_2 = Merchant.create(id: 2, name: "Movement Gym")
      merchant_2.items.create(title: "Chalk Bag",
                            description: "A super cool one",
                            price: 150,
                            image: "X",
                            merchant_id: 2)
      merchant_2.items.create(title: "Belay Device",
                            description: "You can climb with friends now!",
                            price: 150,
                            image: "X",
                            merchant_id: 2)
      visit '/merchants-dashboard'

      expect(page).to have_content("Movement Gym")
    end
  end
end
