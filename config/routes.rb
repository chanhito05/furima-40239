Rails.application.routes.draw do
  devise_for :users
  resources :items do
   resources :purchases, only: [:new, :create]
   resources :products, only: [:edit, :update]

  end
  root to: 'items#index'

end
