class Category < ApplicationRecord
  has_many :category_assignments, dependent: :destroy
  has_many :products, through: :category_assignments
end
