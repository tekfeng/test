class VendorCategory < ActiveRecord::Base
  has_many :vendors
  validates :name, presence: true
  validate :name_uniqueness
  
   scope :search_all, -> (word) {where("name LIKE :word", word: "%#{word}%")}    
   
  def name_uniqueness
    vd_cate = VendorCategory.find_by_name(self.name)
    if vd_cate
      self.errors.add(:name, "has already been taken")
    else
      return true
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
