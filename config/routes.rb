Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders do
    get :orders_by_period, on: :collection
    get :orders_by_period_csv, on: :collection
    get :orders_by_customer, on: :collection
  end
end
