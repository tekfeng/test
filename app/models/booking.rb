class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_many :booking_tour_category_tours, dependent: :destroy
  accepts_nested_attributes_for :booking_tour_category_tours, allow_destroy: true
  after_create :create_booking_code
    
  validates :customer_id, :contact_number, :travel_date, :travel_to, :presence => true
  validates :contact_number, numericality: true, :if => :contact_number_not_blank
  
  
   
  validate :validate_num_of_pax
  
  
  BOOKING_STATUS = ['Confirm invoice', 'Need follow up', 'Replied', 'Closed', 'Unpaid', 'Allocated', 'Fully booked']
  
  def contact_number_not_blank
    self.contact_number != ""
  end
  
  
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
    bookings = self.all.joins(:customer).joins(:user)
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
  
  def validate_num_of_pax
    value_return = true
    if self.number_of_pax == 0
      self.errors.add(:number_adult, "must be at least 1")
      value_return = false  
    end
    return value_return
  end
  
  def number_of_pax
    if self.number_adult and self.number_child
      self.number_adult + self.number_child
    elsif self.number_adult
      self.number_adult
    elsif self.number_child
      self.number_child
    else
      0
    end     
  end
  
end
