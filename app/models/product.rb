class Product < ApplicationRecord
  has_many :category_assignments, dependent: :destroy
  has_many :categories, through: :category_assignments
  has_many :orders, through: :order_items
end
