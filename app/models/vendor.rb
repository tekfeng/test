class Vendor < ActiveRecord::Base
  belongs_to :city
  belongs_to :vendor_category
  
  has_many :vendor_rates, dependent: :destroy
  has_many :rooms, dependent: :destroy
  
  belongs_to :user_created, :class_name => "User", :foreign_key => "user_create_id"
  belongs_to :user_updated_lastest, :class_name => "User", :foreign_key => "user_update_id"
  
  validates :name, :vendor_type, :contact, :fax, :vendor_category_id, :city_id, presence: true
  validates :contact, :fax, numericality: true
  validates :email, :uniqueness => true
  validates :email, :email => true
  
  accepts_nested_attributes_for :vendor_rates, allow_destroy: true
  accepts_nested_attributes_for :rooms, allow_destroy: true
  
  scope :search_all, -> (word) {where("name LIKE :word or vendor_type LIKE :word or email LIKE :word or contact LIKE :word or fax LIKE :word", word: "%#{word}%")}  
  
   
  after_create :create_4_vendor_rates
  
  def create_4_vendor_rates
    for num in 1..4
      vendor_rates = self.vendor_rates.new({rate_type: num})
      vendor_rates.save(validate: false)
    end
  end
  
  def self.showing_section(request)
    path = request.original_fullpath.split("/")[1][/[^?]+/]
    case path
    when "tour_categories", "tours", "users"
      return 1
    when "leads", "customers", "bookings", "incomings", "sales"
      return 2
    when "vendors", "vendor_categories", "vendor_rates", "mtq_slots"
      return 5
    else 
      return 0
    end  
  end
  
  def self.ransackable_scopes(auth_object = nil)
    if auth_object.try(:admin?)
      # allow admin users access to all three methods
    else
      # allow other users to search on active and hired_since only
      %i(active search_all)
    end
  end
  
  
  
end
