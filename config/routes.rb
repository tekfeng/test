Rails.application.routes.draw do
  devise_for :users
  get 'backbonejs/app'
  
  root :to => 'backbonejs#app'
  
  namespace :api do
    resources :tour_categories
    resources :tours
    resources :users
    resources :customers
  end
end
