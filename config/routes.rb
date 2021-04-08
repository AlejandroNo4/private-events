Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :destroy, :show]

  root "home#index"
end
