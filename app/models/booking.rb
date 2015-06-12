class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :booking_tour_category_tours, dependent: :destroy
  accepts_nested_attributes_for :booking_tour_category_tours, allow_destroy: true
  after_create :create_booking_code
  
  validates :customer_id, :contact_number, :travel_date, :travel_to, :number_adult, :number_child, :presence => true
  
  BOOKING_STATUS = ['Confirm invoice', 'Need follow up', 'Replied', 'Closed', 'Unpaid', 'Allocated', 'Fully booked', 'No response', 'Cancel invoice']

  def create_booking_code
    if self.booking_number.nil?
      begin
        self.booking_number = SecureRandom.hex(len=7).to_i(16).to_s(36)[0..9].upcase
      end while self.class.exists?(booking_number: self.booking_number)
    end
    self.status = "Unpaid"   
    self.save(validate: false)
  end
  
  def self.search(opts)
    bookings = self.all
    bookings = bookings.where("bookings.status = ?", opts[:booking_status]) if opts[:booking_status]
    bookings = bookings.where("bookings.user_id = ?", opts[:user_id].to_i) if opts[:user_id] && opts[:user_id].to_i != 0        
    if opts[:travel_date].present?    
      travel_date = (opts[:travel_date] + " 00:00:00").to_datetime
      bookings = bookings.where("travel_date >= :time_start", time_start: travel_date)  
    end
    if opts[:travel_to].present? 
      travel_to = (opts[:travel_to] + " 23:59:59").to_datetime
      bookings = bookings.where("travel_to <= ?", travel_to)  
    end   
    return bookings    
  end
  
end
