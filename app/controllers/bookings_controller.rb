class BookingsController < BaseController
  def index
    @bookings = Booking.all
  end
  
  def new
    @booking = Booking.new
  end
  
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id    
    if @booking.save      
      if params[:booking] and params[:booking][:booking_tour_category_tours_attributes]
        params[:booking][:booking_tour_category_tours_attributes].each do |key, value|
          @booking.booking_tour_category_tours.create({
            tour_id: value[:tour_id].to_i,
            tour_category_id: value[:tour_category_id]
          })
        end
      end
      
      redirect_to bookings_url
    else
      render json: { result: 'failed', errors: @booking.errors }
    end
  end
  
  private

  def booking_params
    params.require(:booking).permit(:customer_id, :travel_date, :travel_to, :tour_id, :status, :sales_person, :itinerary, :booking_number, :booking_date, :number_adult, :number_child)
  end
end
