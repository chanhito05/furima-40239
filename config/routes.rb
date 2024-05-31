Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
    devise_for :users
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :articles, only: [:index, :new]
    resources :messages

    root to: 'items#index'
  
  end