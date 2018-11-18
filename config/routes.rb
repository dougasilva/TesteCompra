Rails.application.routes.draw do
  resources :customers
  resources :products
  root to: 'welcome#index'
end
