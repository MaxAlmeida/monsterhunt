Rails.application.routes.draw do
  resources :users
  resources :collected_coins, only: [:create]
  resources :killed_monsters, only: [:create]
  resources :deaths, only: [:create]
  root 'home#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :trophies, only: [:index]


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'gameplay', to: 'sessions#game_play', as: 'gameplay'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
