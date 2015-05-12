class ToursController < BaseController
  
  def index
    @tours = Tour.all
  end
  
  def new
    @tour = Tour.new
  end
  
  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      render json: { result: 'ok', redirect_to: tours_url, 
        flash: { type: :notice, message: 'Tour has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @tour.errors }
    end
  end
  
  def edit
    @tour = Tour.find_by_id(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update_attributes(tour_params)
      render json: {result: 'ok', redirect_to: tours_url, 
        flash: { type: :notice, message: 'Tour details has been saved successfully!' }}
    else
      render json: { result: 'failed', errors: @tour.errors }
    end
  end
  
  private

  def tour_params
    params.require(:tour).permit(:name, :code, :tour_category_id)
  end
end
