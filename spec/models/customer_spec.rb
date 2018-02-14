require 'rails_helper'

RSpec.describe Customer, type: :model do
  before :each do
    user_a = create(:customer)
    user_b = create(:customer)

    apple = Product.create!(name: 'apple')
    milk = Product.create!(name: 'milk')
    beef = Product.create!(name: 'beef')
    chicken = Product.create!(name: 'chicken')

    produce = Category.create!(name: 'produce')
    dairy = Category.create!(name: 'dairy')
    meats = Category.create!(name: 'meats')

    apple.categories << produce
    apple.save!

    milk.categories << dairy
    milk.save!

    beef.categories << meats
    beef.save!

    #create orders for user 'a'
    ao1 = user_a.orders.create!    
    ao2 = user_a.orders.create!
    ao1.products << apple
    ao1.products << milk
    ao2.products << beef
    ao1.save!
    ao2.save!

    #create order for user 'b'
    bo1 = user_b.orders.create!
    bo1.products << milk
    bo1.products << chicken
    bo1.save!
  end

  describe "customer_order_count_by_category" do
    it "should return the number of orders by category for each customer" do
      Customer.customer_order_count_by_category
    end
  end
end
