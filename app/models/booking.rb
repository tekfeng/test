class Booking < ActiveRecord::Base
  belongs_to :user
  has_many :tours
  belongs_to :customer
  accepts_nested_attributes_for :tours, allow_destroy: true
  after_create :create_booking_code
  
  
  def create_booking_code
    if self.booking_number.nil?
      begin
        self.booking_number = SecureRandom.hex(len=7).to_i(16).to_s(36)[0..9].upcase
      end while self.class.exists?(booking_number: self.booking_number)
    end
    self.status = "Unpaid"   
    self.save(validate: false)
  end
  
end
