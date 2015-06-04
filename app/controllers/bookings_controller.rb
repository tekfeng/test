class BookingsController < BaseController
  def index
    @bookings = Booking.all
  end
  
  def new
  end
end
