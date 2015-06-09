class Lead < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  has_many :tours
  accepts_nested_attributes_for :tours, allow_destroy: true
  
  has_many :lead_tour_category_tours, dependent: :destroy
  accepts_nested_attributes_for :lead_tour_category_tours, allow_destroy: true  
  
  after_create :create_default_value
   
  BOOKING_STATUS = ['Confirm invoice','Need follow up','Replied','Closed','Allocated','Fully booked','No response','Cancel invoice']
    
  def create_default_value
    self.status = "Allocated"   
    self.save(validate: false)
  end
  
  def self.search(opts)
    leads = self.all
    leads = leads.where("leads.status = ?", opts[:lead_status]) if opts[:lead_status]
    leads = leads.where("leads.user_id = ?", opts[:user_id].to_i) if opts[:user_id] && opts[:user_id].to_i != 0    
    
    
     
    if opts[:travel_from].present?    
      travel_from = (opts[:travel_from] + " 00:00:00").to_datetime
      leads = leads.where("travel_from >= :time_start", time_start: travel_from)  
    end
    p "travel_from = #{travel_from}"
    if opts[:travel_to].present? 
      travel_to = (opts[:travel_to] + " 23:59:59").to_datetime
      leads = leads.where("travel_to <= ?", travel_to)  
    end
    
    return {leads: leads }
    
  end
  
end


