class Lead < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  has_many :tours
  accepts_nested_attributes_for :tours, allow_destroy: true
  
  has_many :lead_tour_category_tours, dependent: :destroy
  accepts_nested_attributes_for :lead_tour_category_tours, allow_destroy: true
  
  has_and_belongs_to_many :tours, join_table: "lead_tours"
  
  
  after_create :create_default_value
   
  BOOKING_STATUS = ['Confirm invoice','Need follow up','Replied','Closed','Allocated','Fully booked','No response','Cancel invoice']
  
  
  
  def create_default_value
    self.status = "Allocated"   
    self.save(validate: false)
  end
  
  
end


