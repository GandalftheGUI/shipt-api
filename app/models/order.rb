class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  enum status: [:waiting_for_delivery, :on_its_way, :delivered]
end
