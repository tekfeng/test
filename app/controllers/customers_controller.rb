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
      @customers = Customer.search(params)[:customers]
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
      render template: "customers/new"
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
      render template: "customers/edit"
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :email_address, :contact_number, :address, :country_id, :source_id)
  end
end
