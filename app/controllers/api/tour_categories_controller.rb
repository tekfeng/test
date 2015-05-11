class Api::TourCategoriesController < Api::BaseController
  
  def index
    render json: TourCategory.search(params)
  end
  
  def create
    @tour_category = TourCategory.new(tour_category_params)
    if @tour_category.save
      render json: {status: 'successful'}
    else
      render json: {status: 'failed', errors: @tour_category.errors.full_messages}, status: 422
    end
  end
  
  def edit
    @tour_category = TourCategory.find_by_id(params[:id])
    if @tour_category
      render json: @tour_category
    else
      render json: {status: 'failed', errors: "No such Tour Category"}, status: 422
    end
  end
  
  def update
    @tour_category = TourCategory.find_by_id(params[:id])
    if @tour_category
      if @tour_category.update_attributes(tour_category_params)
        render json: {status: 'successful'}
      else
        render json: {status: 'failed', errors: @tour_category.errors.full_messages}, status: 422
      end
    else
      render json: {status: 'failed', errors: "No such Tour Category"}, status: 422
    end
  end
  
  private

  def tour_category_params
    params.require(:tour_category).permit(:name)
  end
end
