class CustomersController < BaseController
  def index
    @customers = Customer.all
    @countries = Country.all
    @sources = Source.all
    if params.present?
      @customers = Customer.search(params)[:customers]
    end
  end
  
  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: {result: 'ok', redirect_to: customers_url,
        flash: { type: :notice, message: 'Customer has been created successfully!' }}
        @current_customer_id = @customer.id
    else
      render json: {result: 'false', error: @customer.error}
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
