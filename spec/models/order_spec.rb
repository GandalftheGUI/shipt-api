require 'rails_helper'

RSpec.describe Order, type: :model do
  before :each do
    @user_a = create(:customer)
    @user_b = create(:customer)

    @apple = Product.create!(name: 'apple')
    @milk = Product.create!(name: 'milk')
    @beef = Product.create!(name: 'beef')
    @chicken = Product.create!(name: 'chicken')

    @produce = Category.create!(name: 'produce')
    @dairy = Category.create!(name: 'dairy')
    @meats = Category.create!(name: 'meats')

    @apple.categories << @produce
    @apple.save!

    @milk.categories << @dairy
    @milk.save!

    @beef.categories << @meats
    @beef.save!

    @chicken.categories << @meats
    @chicken.save!

    #create orders for user 'a'
    order_times = [
      DateTime.new(2010,1,1),
      DateTime.new(2010,1,1),
      DateTime.new(2010,1,2),
      DateTime.new(2010,1,2),
      DateTime.new(2010,1,2),
      DateTime.new(2010,1,3),
      DateTime.new(2010,1,18),
      DateTime.new(2010,2,15),
      DateTime.new(2010,2,19),
      DateTime.new(2010,3,11),
      DateTime.new(2010,4,17),
    ]

    order_times.each do |ot|
      #create order for user 'a'
      order_a = @user_a.orders.create!
      order_a.products << @apple
      order_a.products << @milk
      order_a.products << @beef
      order_a.created_at = ot
      order_a.save!

      #create order for user 'b'
      order_b = @user_b.orders.create!
      order_b.products << @milk
      order_b.products << @chicken
      order_b.products << @beef
      order_b.created_at = ot
      order_b.save!
    end
  end

  describe "orders_per_period" do
    context "period = day" do
      it 'should gather correct number of orders' do
        order_info = Order.orders_per_period(DateTime.new(2010,1,1), DateTime.new(2010,1,18), 'day')
        expect(order_info[[DateTime.new(2010,1,1).utc, @milk.id, @milk.name]]).to equal(4)
        expect(order_info[[DateTime.new(2010,1,3).utc, @chicken.id, @chicken.name]]).to equal(1)
      end
    end

    context "period = week" do
      it 'should gather correct number of orders' do
        order_info = Order.orders_per_period(DateTime.new(2010,1,1), DateTime.new(2010,4,17), 'week')
        expect(order_info[[DateTime.new(2009,12,28).utc, @milk.id, @milk.name]]).to equal(12)
        expect(order_info[[DateTime.new(2010,4,12).utc, @chicken.id, @chicken.name]]).to equal(1)
      end
    end

    context "period = month" do
      it 'should gather correct number of orders' do
        order_info = Order.orders_per_period(DateTime.new(2010,1,1), DateTime.new(2010,4,17), 'month')
        expect(order_info[[DateTime.new(2010,1,1).utc, @beef.id, @beef.name]]).to equal(14)
        expect(order_info[[DateTime.new(2010,4,1).utc, @chicken.id, @chicken.name]]).to equal(1)
      end
    end
  end
end
