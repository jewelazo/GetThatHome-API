Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    post '/login', to: 'sessions#create'
    post '/logout', to: 'sessions#destroy'
    resources :properties, :users, :sales, :rents, :favorites
    get 'profile', action: :show, controller: 'users'
    patch 'profile', action: :update, controller: 'users'
  end
end
