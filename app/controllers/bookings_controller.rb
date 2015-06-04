class BookingsController < BaseController
  def index
    @bookings = Booking.all
  end
  
  def new
    @booking = Booking.new
  end
  
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render json: { result: 'ok', redirect_to: bookings_url, 
        flash: { type: :notice, message: 'Booking has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @booking.errors }
    end
  end
  
  def edit
    @booking = Booking.find_by_id(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update_attributes(booking_params)
      render json: {result: 'ok', redirect_to: bookings_url, 
        flash: { type: :notice, message: 'Booking details has been saved successfully!' }}
    else
      render json: { result: 'failed', errors: @booking.errors }
    end
  end
  
  private

  def booking_params
    params.require(:booking).permit(:travel_date, :tour_id, :status, :sales_person, :itinerary, :booking_number, :booking_date)
  end
end
