Rails.application.routes.draw do
  get "users/show"
  devise_for :users

  resources :users, only: [:show] do
    resources :posts
  end

  root "static_pages#home"
end
