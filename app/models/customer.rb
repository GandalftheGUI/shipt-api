class Customer < ApplicationRecord
  has_many :orders

  def self.customer_order_count_by_category
    Order.all.joins({:order_items => {:product => :categories}}).joins(:customer).group([:customer_id, :first_name, :category_id, "categories.name"]).count
  end
end
