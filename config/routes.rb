Rails.application.routes.draw do
  devise_for :users  
  
  root :to => 'dashboard#index'
  resources :dashboard
  resources :tour_categories
  resources :tours
  resources :customers
  resources :leads
  resources :bookings
 
  resources :vendors do
     member do
       get :more_details
       get :update_more_details
     end
   end
  
  
  resources :vendor_categories
  resources :vendor_rates do
    member do
      get :view_rate  
      post :update_vendor_rates
      get :edit_rate
      get :update_rate
      get :download_files     
    end    
  end
  
  resources :mtq_slots
  post "/mtq_slot/edit_ajax", :controller => "mtq_slots", action: "edit_mtq_slot"
  get "/up_mtq_slots/updated_ajax", :controller => "mtq_slots", action: "updated_ajax"
  
  get '/vendor_rates_controll/filter_table_by_competitor', :controller => "vendor_rates", action: "filter_table_by_competitor"
  get '/vendors_controll/filter_vendor', :controller => "vendors", action: "filter_vendor"
  
  post "/vendor_rates/:id/update_current_contact/:vendor_id" => 'vendor_rates#update_current_contact'
end
