class VendorsController < ReservationsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def dashboard_page
  end
  
  def index 
    @vendors = Vendor.all.joins(:city)    
    if params[:vendor_category_id]
      @vendors = @vendors.where(vendor_category_id: params[:vendor_category_id].to_i)
      @vendors = smart_listing_create(:vendors, @vendors, partial: "vendors/list", default_sort: {created_at: "desc"}) 
    elsif params[:ajax_call] 
      if params[:category_id].present?
        @vendors = @vendors.where(vendor_category_id: params[:category_id].to_i)
      end
      if params[:city_id].present?
        @vendors = @vendors.where(city_id: params[:city_id].to_i)
      end 
      @vendors = smart_listing_create(:vendors, @vendors, partial: "vendors/list", default_sort: {created_at: "desc"}) 
      render template: "/vendors/filter", layout: false         
    end 
    
    @vendors = Vendor.joins(:city).ransack(params[:search_rs]).result if params[:search_rs] 
    @vendors = smart_listing_create(:vendors, @vendors, partial: "vendors/list", default_sort: {created_at: "desc"}) 
  end  
  
  def new
    @vendor = Vendor.new
  end
  
  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.user_create_id = current_user.id
    if @vendor.save
      flash[:notice] = true
      redirect_to vendors_url
    else
      render template: "vendors/new"
    end
  end
  
  def edit
    @vendor = Vendor.find_by_id(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.user_update_id = current_user.id
    if @vendor.update_attributes(vendor_params)
      flash[:notice] = true
      redirect_to vendors_url
    else
      render :action => "edit"
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
