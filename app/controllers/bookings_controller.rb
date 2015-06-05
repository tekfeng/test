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
      render json: { result: 'ok', redirect_to: bookings_url, 
        flash: { type: :notice, message: 'Booking has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @booking.errors }
    end
  end
  
  private

  def booking_params
    params.require(:booking).permit(:customer_id, :travel_date, :travel_to, :tour_id, :status, :sales_person, :itinerary, :booking_number, :booking_date, :number_adult, :number_child)
  end
end
