class Api::ToursController < Api::BaseController
  
  def index
    render json: Tour.search(params)
  end
  
  def create
    @tour = Tour.new(plant_params)
    if @tour.save
      render json: {status: 'successful'}
    else
      render json: {status: 'failed', errors: @tour.errors.full_messages}, status: 422
    end
  end
  
  def edit
    @tour = Tour.find_by_id(params[:id])
    if @tour
      render json: @tour
    else
      render json: {status: 'failed', errors: "No such Tour"}, status: 422
    end
  end
  
  def update
    @tour = Tour.find_by_id(params[:id])
    if @tour and @tour.update_attributes(tour_params)
      render json: {status: 'successful'}
    else
      render json: {status: 'failed', errors: @tour.errors.full_messages}, status: 422
    end
  end
  
  private

  def tour_params
    params.require(:tour).permit(:code, :name, :tour_category_id)
  end
end
