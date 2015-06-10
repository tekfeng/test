class IncomingsController < BaseController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  
  def index
    @incomings = smart_listing_create(:incomings, Incoming.all, partial: "incomings/list") 
  end
  
  def show
  end    
  
end
