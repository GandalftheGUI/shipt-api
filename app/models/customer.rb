class Customer < ApplicationRecord
  has_many :orders


  def self.customer_order_count_by_category
    
  end
end
