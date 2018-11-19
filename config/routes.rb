Rails.application.routes.draw do
  get 'order/new'
  resources :customers
  resources :products
  resources :charges
  root to: 'welcome#index'
end
