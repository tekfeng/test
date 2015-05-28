Rails.application.routes.draw do
  devise_for :users  
  
  root :to => 'dashboard#index'
  resources :dashboard
  resources :tour_categories
  resources :tours
  resources :customers
  
end
