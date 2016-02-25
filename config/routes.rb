Rails.application.routes.draw do
  devise_for :admins
  resources :orders do
    member do
      get 'close'
      post 'add_food'
    end
  end
  resources :tables
  resources :waiters
  resources :foods do
    collection do
      get 'foods'
      get 'drinks'
    end
  end
  resources :customers

  resources :reports, only: [:index] do
    collection do
      get 'best_selling_foods'
      get 'best_waiters'
      get 'winnings_per_day'
      get 'most_used_tables'
    end
  end

  resources :foods_orders, only: [:destroy]

  root 'tables#index'

  # REST API Standalone Webservices
  namespace :api, {format: :json} do
    namespace :v1 do
      # tables
      get  '/tables',     to: 'api#tables'
      get  '/tables/:id', to: 'api#table'
      post '/tables',     to: 'api#create_table'
      put  '/tables/:id', to: 'api#update_table'
      # orders
      get  '/orders',     to: 'api#orders'
      get  '/orders/:id', to: 'api#order'
      post '/orders',     to: 'api#create_order'
      put  '/orders/:id', to: 'api#update_order'
      # foods
      get    '/foods',     to: 'api#foods'
      get    '/foods/:id', to: 'api#food'
      post   '/foods',     to: 'api#create_food'
      put    '/foods/:id', to: 'api#update_food'
      delete '/foods/:id', to: 'api#destroy_food'
      # drinks
      get    '/drinks',     to: 'api#drinks'
      get    '/drinks/:id', to: 'api#drink'
      post   '/drinks',     to: 'api#create_drink'
      put    '/drinks/:id', to: 'api#update_drink'
      delete '/drinks/:id', to: 'api#destroy_drink'
      # waiters
      get    '/waiters',     to: 'api#waiters'
      get    '/waiters/:id', to: 'api#waiter'
      post   '/waiters',     to: 'api#create_waiter'
      put    '/waiters/:id', to: 'api#update_waiter'
      delete '/waiters/:id', to: 'api#destroy_waiter'
      # customers
      get    '/customers',     to: 'api#customers'
      get    '/customers/:id', to: 'api#customer'
      post   '/customers',     to: 'api#create_customer'
      put    '/customers/:id', to: 'api#update_customer'
      delete '/customers/:id', to: 'api#destroy_customer'
    end
  end

end
