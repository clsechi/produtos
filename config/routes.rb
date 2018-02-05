Rails.application.routes.draw do
  root to: 'home#index'
  resources :periodicities, only: [:index]
  resources :product_categories, only:[:index]
  resources :product_plans, only:[:index]
  resources :products, only:[:index]

  namespace :api do
    resources :categories, only:[:index]
    resources :products, only:[:index]
    resources :product_plans, only:[:index, :show]
    resources :periodicities, only:[:index]
  end
end
