Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :likes, only: [:index, :create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
end

