class TourCategoriesController < AdminsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index 
    if params[:ajax_call]
      @tour_categories = TourCategory.search(params)
      @tour_categories = smart_listing_create(:tour_categories, @tour_categories, partial: "tour_categories/list", default_sort: {created_at: "desc"})  
      render template: "/tour_categories/filter", layout: false
    else
      @tour_categories = TourCategory.all
      @tour_categories = smart_listing_create(:tour_categories, @tour_categories, partial: "tour_categories/list", default_sort: {created_at: "desc"}) 
    end                        
  end
  
  def new
    @tour_category = TourCategory.new
  end
  
  def create
    @tour_category = TourCategory.new(tour_category_params)
    if @tour_category.save
      render json: { result: 'ok', redirect_to: tour_categories_url, 
        flash: { type: :notice, message: 'Tour Category has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @tour_category.errors }
    end
  end
  
  def edit
    @tour_category = TourCategory.find_by_id(params[:id])
  end

  def update
    @tour_category = TourCategory.find(params[:id])
    if @tour_category.update_attributes(tour_category_params)
      render json: {result: 'ok', redirect_to: tour_categories_url, 
        flash: { type: :notice, message: 'Tour Category details has been saved successfully!' }}
    else
      render json: { result: 'failed', errors: @tour_category.errors }
    end
  end
  
  private

  def tour_category_params
    params.require(:tour_category).permit(:name)
  end   
end
