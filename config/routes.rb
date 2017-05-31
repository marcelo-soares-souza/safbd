Rails.application.routes.draw do
  resources :experimentos
  resources :sistemas
  devise_for :users
  resources :users

  get 'home/index'
  get 'home/mapa'

  root to: 'home#index'
end
