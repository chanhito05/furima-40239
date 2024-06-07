# 使う
Rails.application.routes.draw do
  devise_for :users

  # `root`ルートを一つだけ定義
  root to: 'items#index'

  resources :items do
    resources :orders, only: [:index, :create]  # `index`アクションを追加している場合
  end
end
