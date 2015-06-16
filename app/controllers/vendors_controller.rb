class VendorsController < BaseController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def dashboard_page
    render template: "dashboard/dashboard_page", layout: "dashboard"
  end
  
  
  def index   
    if params[:ajax_call]
      @vendors = Vendor.search(params)
      @vendors = smart_listing_create(:vendors, @vendors, partial: "vendors/list", default_sort: {name: "asc"}) 
      render template: "/vendors/filter", layout: false     
    else
      @vendors = Vendor.all
      @vendors = smart_listing_create(:vendors, @vendors, partial: "vendors/list", default_sort: {name: "asc"}) 
    end 
  end
  
  def filter_vendor
    @vendors = Vendor.all   
    if params[:category_id].present?
      @vendors = @vendors.where(vendor_category_id: params[:category_id].to_i)
    end    
    if params[:city_id].present?
      @vendors = @vendors.where(city_id: params[:city_id].to_i)
    end      
    render partial: "/#{params[:render_to_view]}/vendor_table"   
  end
  
  def new
    @vendor = Vendor.new
  end
  
  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.user_create_id = current_user.id
    if @vendor.save
      render json: { result: 'ok', redirect_to: vendors_url, 
        flash: { type: :notice, message: 'Vendor has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @vendor.errors }
    end
  end
  
  def edit
    @vendor = Vendor.find_by_id(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.user_update_id = current_user.id
    if @vendor.update_attributes(vendor_params)
      render json: { result: 'ok', redirect_to: vendors_url, 
        flash: { type: :notice, message: 'Vendor has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @vendor.errors }
    end
  end
  
  def more_details
    @vendor = Vendor.find(params[:id])
  end
  
  def update_more_details
    @vendor = Vendor.find(params[:id])
    if @vendor.update_attributes(vendor_params)
      redirect_to vendors_url
    else
      render :action => "more_details"
    end
  end
  
  private

  def vendor_params
    params.require(:vendor).permit(:name, :email, :fax, :contact, :city_id, :vendor_type, :vendor_category_id, rooms_attributes: [:id, :name, :_destroy])
  end
end
