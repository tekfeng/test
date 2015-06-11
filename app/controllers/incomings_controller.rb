class IncomingsController < SalesController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @incomings = Incoming.all 
    @incomings = Incoming.ransack(params[:search]).result if params[:search] 
    @incomings = smart_listing_create(:incomings, @incomings, partial: "incomings/list") 
  end
  
  def show
  end    
  
end
