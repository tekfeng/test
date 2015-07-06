class Lead < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  
  LEAD_STATUS = ['Confirm invoice', 'Need follow up', 'Replied', 'Closed', 'Unpaid', 'Allocated', 'Fully booked']
  
  has_many :notifications, as: :notifitable
  has_many :lead_tour_category_tours, dependent: :destroy
  accepts_nested_attributes_for :lead_tour_category_tours, allow_destroy: true  
  
  after_create :create_default_value
  
  validate :validate_num_of_pax
  
  def validate_num_of_pax
    value_return = true
    if self.number_of_pax == 0
      self.errors.add(:adults, "should be numbers")
      self.errors.add(:children, "should be numbers")
      value_return = false  
    end
    return value_return
  end
  
  def number_of_pax
    if self.adults and self.children
      self.adults.to_i + self.children.to_i
    elsif self.adults
      self.adults.to_i
    elsif self.children
      self.children.to_i
    else
      0
    end     
  end
  
  validates :customer_id, :contact_number, :travel_from, :travel_to, :office, :presence => true
  validates :contact_number, numericality: true, :if => :contact_number_not_blank
  
  def contact_number_not_blank
    self.contact_number != ""
  end
    
  def create_default_value
    self.status = "Allocated"   
    self.save(validate: false)
  end
  
  def self.search(opts)
    leads = self.all
    leads = leads.where("leads.status = ?", opts[:lead_status]) if opts[:lead_status].present?
    leads = leads.where("leads.user_id = ?", opts[:user_id].to_i) if opts[:user_id].present? 
    if opts[:travel_from].present?    
      travel_from = (opts[:travel_from] + " 00:00:00").to_datetime
      leads = leads.where("travel_from >= :time_start", time_start: travel_from)  
    end
    if opts[:travel_to].present? 
      travel_to = (opts[:travel_to] + " 23:59:59").to_datetime
      leads = leads.where("travel_to <= ?", travel_to)  
    end   
    return leads    
  end
  
  def number_of_pax
    if self.adults and self.children
      self.adults + self.children
    elsif self.adults
      self.adults
    elsif self.children
      self.children
    else
      ""
    end     
  end
  
end


