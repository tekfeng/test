class BookingsController < BaseController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    if params[:ajax_call]
      @bookings = Booking.search(params)
      @bookings = smart_listing_create(:bookings, @bookings, partial: "bookings/list", default_sort: {travel_date: "asc"}) 
      render template: "/bookings/filter", layout: false     
    else
      @bookings = Booking.all
      @bookings = smart_listing_create(:bookings, @bookings, partial: "bookings/list", default_sort: {travel_date: "asc"}) 
    end
  end
  
  def new
    @booking = Booking.new
  end
  
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id    
    if @booking.save 
      redirect_to bookings_url
    else
      render template: "/bookings/new"
    end
  end
  
  def convert_to_booking
    @lead = Lead.find_by_id(params[:id])
    @booking = Booking.new({
      travel_date: @lead.travel_from,
      customer_id: @lead.customer_id,
      travel_to: @lead.travel_to,
      contact_number: @lead.contact_number,
      number_child: @lead.children,
      number_adult: @lead.adults,
      user_id: @lead.user_id
    })
    @lead.lead_tour_category_tours.each do |leadtour|
      @booking.booking_tour_category_tours.new({
        tour_id: leadtour.tour_id,
        tour_category_id: leadtour.tour_category_id
      })
    end
    render template: "/bookings/new", locals: {lead: true} 
  end
  
  def send_pdf_mailer    
    @booking = Booking.find_by_id(params[:id])
    @booking.check_send_itinerary = true
    @booking.save(validate: false)
    ApplicationMailer.delay.send_ltinerary_pdf(@booking.customer, @booking)
    redirect_to bookings_url
  end
  
  def check_is_first_send_itinerary
    @booking = Booking.find_by_id(params[:id])
    render :json => {sended: @booking.check_send_itinerary}
  end
  
  private

  def booking_params
    params.require(:booking).permit(:customer_id, :travel_date, :travel_to, :tour_id, :status, :sales_person, :itinerary, :booking_number, :booking_date, :number_adult, :number_child, :contact_number, booking_tour_category_tours_attributes:[:id, :tour_id, :tour_category_id ,:_destroy])
  end
end
