class TourCategoriesController < BaseController
  
  def index
    @tour_categories = TourCategory.all
    @order = "asc"
    if params.present?
      @tour_categories = TourCategory.search(params)[:tour_categories]
      if (params[:order].present?)
        @order = params[:order].to_s
        @tour_categories = @tour_categories.order("name " + params[:order])
      else
        @tour_categories = @tour_categories.order("name asc")
      end
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
