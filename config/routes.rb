Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :periodicities, only: [:index, :new, :create]

  resources :product_categories, only:[:index, :show, :new, :create, :edit,
                                       :update] do
    resources :products, only:[:new, :create, :edit, :update]
  end

  resources :products, only:[:index, :show,] do
    resources :product_plans, only:[:new, :create, :edit, :update]
  end

  resources :product_plans, only:[:index, :show] do
    resources :plan_prices, only:[:new, :create]
  end

  resources :plan_prices, only:[:index, :show]

  namespace :api do
    resources :categories, only:[:index, :show] do
      resources :products, only:[:index]
    end
    resources :products, only:[:index, :show] do
      resources :product_plans, only:[:index]
    end
    resources :product_plans, only: [:index, :show] do
      resources :plan_prices, only: [:index]
    end
    resources :periodicities, only: [:index]
  end
end
