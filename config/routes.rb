Rails.application.routes.draw do
  
  
  post "/users", :controller => "users", action: "create"
  devise_for :users  
  
  get 'quotation', controller: 'dashboard', action: 'quotation'
  get 'invoice', controller: 'dashboard', action: 'invoice'
  get 'itinerary', controller: 'dashboard', action: 'itinerary'
  get 'sales/dashboard', controller: 'sales', action: 'dashboard' 
  
  root :to => 'dashboard#index'
  resources :dashboard
  
  resources :users
  
  resources :tour_categories
  
  resources :tours do
    collection do
      get 'dashboard_page'
    end
    member do
      get :tour_of_tour_category
    end
  end
  
  scope 'sales' do
    resources :incomings do
      member do
        post :submit_comment
        post :create_lead_base_on_ic
      end  
    end  
    resources :customers 
    resources :leads do 
      collection do
        get 'read_notification'
        get :notifications_of_user
      end
      member do  
        get :send_pdf_quotation
        
      end
      
    end
    resources :bookings do
      
      member do
        get :check_is_first_send_itinerary
        get :convert_to_booking
        get :send_pdf_mailer
      end
    end
  end  
 
  resources :vendors do    
    collection do
      get 'dashboard_page'
    end
    
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
  
  # /vendor_rates/4/update_vendor_rates
  
  get "/vendor_rates/:id/update_vendor_rates", :controller => "vendor_rates", action: "view_rate" 
end
