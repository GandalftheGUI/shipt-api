class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  enum status: [:waiting_for_delivery, :on_its_way, :delivered]

  def self.orders_per_period(start_date, end_date, period)
    throw "Period: '#{period}' not supported" unless ["day", "week", "month"].include?(period)
    order_info = Order.joins(:products).where('orders.created_at BETWEEN ? AND ?', start_date.beginning_of_day, end_date.end_of_day).group("date_trunc('#{period}', orders.created_at)", "products.id", "products.name").count
  end
end
