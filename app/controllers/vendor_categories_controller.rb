class VendorCategoriesController < BaseController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @vendor_categories = VendorCategory.all
    if params[:ajax_call]
      @vendor_categories = VendorCategory.search(params)
      @vendor_categories = smart_listing_create(:vendor_categories, @vendor_categories, partial: "vendor_categories/list", default_sort: {name: "asc"}) 
      render template: "/vendors/filter", layout: false     
    else
      @vendor_categories = VendorCategory.all
      @vendor_categories = smart_listing_create(:vendor_categories, @vendor_categories, partial: "vendor_categories/list", default_sort: {name: "asc"}) 
    end 
  end
  
  def new
    @vendor_category = VendorCategory.new
  end
  
  def create
    @vendor_category = VendorCategory.new(vendor_category_params)
    if @vendor_category.save
      render json: { result: 'ok', redirect_to: vendor_categories_url, 
        flash: { type: :notice, message: 'VendorCategories has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @vendor_category.errors }
    end
  end
  
  def edit
    @vendor_category = VendorCategory.find_by_id(params[:id])
  end

  def update
    @vendor_category = VendorCategory.find(params[:id])
    if @vendor_category.update_attributes(vendor_category_params)
      render json: {result: 'ok', redirect_to: vendor_categories_url, 
        flash: { type: :notice, message: 'VendorCategories details has been saved successfully!' }}
    else
      render json: { result: 'failed', errors: @vendor_category.errors }
    end
  end
  
  private

  def vendor_category_params
    params.require(:vendor_category).permit(:name)
  end
end
