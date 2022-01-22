Rails.application.routes.draw do
  root to: "articles#index"
  resources :articles
  resources :users, only: :show
  devise_for :users
end
