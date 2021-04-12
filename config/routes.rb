Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :destroy, :show] do
    get :attend, on: :member
  end
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root "events#index"
end
