class CustomersController < BaseController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def dashboard_page
    render template: "dashboard/dashboard_page", layout: "dashboard"
  end
  
  def index
    @countries = Country.all
    @sources = Source.all
    if params[:ajax_call]
      @customers = Customer.search(params)
      @customers = smart_listing_create(:customers, @customers, partial: "customers/list", default_sort: {name: "asc"}) 
      render template: "/customers/filter", layout: false
    else
      @customers = Customer.all
      @customers = smart_listing_create(:customers, @customers, partial: "customers/list", default_sort: {name: "asc"}) 
    end                        
  end
  
  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: {result: 'ok', redirect_to: customers_url, customer_id: @customer.id, modal_box: true,
        flash: { type: :notice, message: 'Customer details has been saved successfully!' }}
    else
      render json: {result: 'failed', errors: @customer.errors}
    end
  end
  
  def edit
    
    @customer = Customer.find_by_id(params[:id])   
    if params[:lead_id]    
      @params_redirect_to = "?lead_id=#{params[:lead_id]}"
    elsif params[:booking_lead_id].present?
      @params_redirect_to = "?booking_lead_id=#{params[:booking_lead_id].to_s}"
    else
      @params_redirect_to = ""
    end    
  end
  
  def update
    @customer = Customer.find(params[:id])    
    if @customer.update_attributes(customer_params)    
      if params[:lead_id]
        if params[:lead_id].present?
          redirect_with_url = '/sales/leads/' + params[:lead_id].to_s + '/edit'
        else
          redirect_with_url = '/sales/leads/new?customer_id=' + @customer.id.to_s
        end
      elsif params[:booking_lead_id].present?
        redirect_with_url = '/sales/bookings/' + params[:booking_lead_id].to_s + '/convert_to_booking'        
      else
        redirect_with_url = customers_url       
      end      
      render json: {result: 'ok', redirect_to: redirect_with_url,
        flash: { type: :notice, message: 'Customer details has been saved successfully!' }}
    else
      render json: {result: 'failed', errors: @customer.errors}
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :email_address, :contact_number, :address, :country_id, :source_id)
  end
end
