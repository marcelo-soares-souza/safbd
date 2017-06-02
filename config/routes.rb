Rails.application.routes.draw do
  resources :plantas do
    resources :experimentos
  end

  resources :experimentos do
    resources :plantas
  end

  resources :sistemas do
    resources :experimentos
  end

  devise_for :users
  resources :users

  get 'home/index'
  get 'home/mapa'

  root to: 'home#index'
end
