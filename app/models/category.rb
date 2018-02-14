class Category < ApplicationRecord
  has_many :products, through :category_assignments
  has_many :category_assignments, dependent: :destroy
end
