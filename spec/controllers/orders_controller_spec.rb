require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'GET /'

  describe 'GET /orders/orders_by_period' do
    before :each do
      @start = DateTime.new(2009,1,1).utc.to_s
      @end = DateTime.new(2010,1,1).utc.to_s
      @valid_attributes = {start_date: @start, end_date: @end, period: "day"}
    end

    context 'when request is valid' do
      it 'should call orders_by_period method' do
        expect(Order).to receive(:orders_per_period).with(@start.to_datetime, @end.to_datetime, "day")
        get :orders_by_period, params: @valid_attributes
      end

      it 'returns status code 200' do
        get :orders_by_period, params: @valid_attributes
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /orders/orders_by_period/csv ' do
    before :each do
      @start = DateTime.new(2009,1,1).utc.to_s
      @end = DateTime.new(2010,1,1).utc.to_s
      @valid_attributes = {start_date: @start, end_date: @end, period: "day"}
    end

    context 'when request is valid' do
      it 'should call orders_by_period method' do
        expect(Order).to receive(:orders_per_period).with(@start.to_datetime, @end.to_datetime, "day", true)
        get :orders_by_period_csv, params: @valid_attributes
      end
      
      it 'returns status code 200' do
        get :orders_by_period_csv, params: @valid_attributes
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /orders/:customer_id' do
    before :each do
      @valid_attributes = {customer_id: 1}
    end

    context 'when request is valid' do
      it 'should call Orders.where method' do
        expect(Order).to receive(:where).with(customer_id: 1)
        get :orders_by_customer, params: @valid_attributes
      end
      
      it 'returns status code 200' do
        get :orders_by_customer, params: @valid_attributes
        expect(response).to be_successful
      end
    end
  end
end
