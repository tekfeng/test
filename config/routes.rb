Rails.application.routes.draw do
  devise_for :users  
  
  get 'quotation', controller: 'dashboard', action: 'quotation'
  get 'invoice', controller: 'dashboard', action: 'invoice'
  get 'itinerary', controller: 'dashboard', action: 'itinerary'
  
  root :to => 'dashboard#index'
  resources :dashboard
  resources :tour_categories
  resources :tours
  resources :customers
  resources :leads
  resources :bookings
  
  
  
end
