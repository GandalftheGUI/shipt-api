class Order < ApplicationRecord
  belong_to :customer
  has_many :products, through :order_items
  has_many :order_items, dependent: :destroy

  enum status: [:waiting_for_delivery, :on_its_way, :delivered]
end
