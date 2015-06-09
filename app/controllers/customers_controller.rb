class CustomersController < BaseController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  def dashboard_page
    render template: "dashboard/dashboard_page", layout: "dashboard"
  end
  
  def index
    @customers = Customer.all
    @countries = Country.all
    @sources = Source.all
    if params[:ajax_call]
      @customers = Customer.search(params)[:customers]
      render :partial => '/customers/list', locals: {customers: @customers}
    end
    
   @customers = smart_listing_create(:customers, Customer.unscoped, partial: "customers/list") 
   
                         
  end
  
  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: {result: 'ok', redirect_to: customers_url, customer_id: @customer.id,
        flash: { type: :notice, message: 'Customer details has been saved successfully!' }}
    else
      render json: {result: 'false', error: @customer.errors}
    end
  end
  
  def edit
     @customer = Customer.find_by_id(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      render json: {result: 'ok', redirect_to: customers_url,
        flash: { type: :notice, message: 'Customer details has been saved successfully!' }}
    else
      render json: { result: 'failed', errors: @customer.errors }
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :email_address, :contact_number, :address, :country_id, :source_id)
  end
end
