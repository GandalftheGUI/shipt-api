class OrdersController < ApplicationController
  #get /orders/orders_by_period
  def orders_by_period
    @order_info = Order.orders_per_period(
      params[:start_date].to_datetime,
      params[:end_date].to_datetime,
      params[:period]
    )

    render json: @order_info, status: :ok
  end

  #get /orders/orders_by_period/csv
  def orders_by_period_csv
    @order_info = Order.orders_per_period(
      params[:start_date].to_datetime,
      params[:end_date].to_datetime,
      params[:period],
      true
    )

    render json: @order_info, status: :ok
  end

  #get /orders/:customer_id
  def orders_by_customer
    render json: Order.where(customer_id: params[:customer_id].to_i), status: :ok
  end
end
