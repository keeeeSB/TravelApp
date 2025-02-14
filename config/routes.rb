Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [ :show ] do
    resources :posts do
      resources :likes, only: [ :create, :destroy ]
    end
    resources :likes, only: [ :index ]
  end

  root "static_pages#home"
end
