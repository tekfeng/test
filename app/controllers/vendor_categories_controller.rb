class VendorCategoriesController < ReservationsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @vendor_categories = VendorCategory.all
      
    if params[:ajax_call]
      @vendor_categories = VendorCategory.search(params)
      @vendor_categories = smart_listing_create(:vendor_categories, @vendor_categories, partial: "vendor_categories/list", default_sort: {created_at: "desc"}) 
      render template: "/vendors/filter", layout: false     
    else
      @vendor_categories = VendorCategory.all
      @vendor_categories = VendorCategory.ransack(params[:search_rs]).result if params[:search_rs]
      @vendor_categories = smart_listing_create(:vendor_categories, @vendor_categories, partial: "vendor_categories/list", default_sort: {created_at: "desc"})  
    end 
  end
  
  def new
    @vendor_category = VendorCategory.new
  end
  
  def create
    @vendor_category = VendorCategory.new(vendor_category_params)
    if @vendor_category.save
      flash[:notice] = true
      redirect_to vendor_categories_url
    else
      render template: "vendor_categories/new"
    end
  end
  
  def edit
    @vendor_category = VendorCategory.find_by_id(params[:id])
  end

  
  def update
    @vendor_category = VendorCategory.find(params[:id])
    if @vendor_category.update_attributes(vendor_category_params)
      flash[:notice] = true
      redirect_to vendor_categories_url
    else
      render :action => "edit"
    end
  end
  
  private

  def vendor_category_params
    params.require(:vendor_category).permit(:name)
  end
end
