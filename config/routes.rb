Rails.application.routes.draw do
  resources :users
  root 'home#index'
  resources :sessions, only: [:new, :create, :destroy]


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'gameplay', to: 'sessions#game_play', as: 'gameplay'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
