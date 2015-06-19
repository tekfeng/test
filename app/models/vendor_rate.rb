class VendorRate < ActiveRecord::Base
  # rate_type value 1: contact current rate, 2:next contact rate, 3: competitor rate, 4: ad-hoc rate
  belongs_to :vendor
  has_many :competitors
  has_many :season_room_prices  
  
  validates :effective, :expired, presence: true, :unless => :is_competitor_rate
  
  accepts_nested_attributes_for :competitors, allow_destroy: true

  has_attached_file :contract_file
  do_not_validate_attachment_file_type :contract_file
  # validates_attachment_content_type :contract_file, :content_type => ["application/download", "application/pdf","application/vnd.ms-excel",
  #            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  #            "application/msword",
  #            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  #            "text/plain"]
             
  
  def is_competitor_rate
    if self.rate_type == 3
      true
    else
      false
    end
  end
  
  def check_validate
    if self.is_competitor_rate
      true
    else 
      
    end
  end
  
  
end
