Rails.application.routes.draw do
  root to: 'home#index'
  resources :periodicities, only: [:index]
end
