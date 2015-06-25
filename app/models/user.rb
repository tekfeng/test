class User < ActiveRecord::Base
  has_many :bookings
  has_many :leads
  has_many :incomings
  belongs_to :department
  has_many :notifications
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :vendors
  validates :email, :uniqueness => true
  validates :email, :email => true
  validates :username, :contact_number, :department_id, :presence => true
  validates :contact_number, numericality: true
  
  has_attached_file :avatar, 
                    :styles => { :medium => "110x110#" }, 
                    :convert_options => { :all => "-quality 50 -strip" }
                    
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # validates_attachment_presence :avatar
  
  def self.search(opts)
    columns_condition = self.columns.inject([]) do |array, el|
      array << "lower(#{self.table_name}.#{el.name}) LIKE :keyword" if (el.type == :string or el.type == :text)
      array
    end   
    users = self.all.joins(:department)
    users = users.where(columns_condition.join(" OR "), keyword: "%#{opts[:keyword].downcase}%" ) if opts[:keyword] && opts[:keyword] != ""
    return users
  end
  
  def status_unread
    self.notifications.where(is_read: false)
  end
  
  def update_password(data)
    if !self.new_record?
      errors.add(:password, "The new password is required") if data[:password].length == 0
      errors.add(:password_confirmation, "The confirm password is required") if data[:password_confirmation].length == 0
      
      if data[:current_password].length == 0
        errors.add(:current_password, "The old password is required") 
      elsif !valid_password?(data[:current_password])
        errors.add(:current_password, "Please enter correct password")
      elsif data[:password] != data[:password_confirmation]
        errors.add(:password, "Your password and confirmation password do not match")
        errors.add(:password_confirmation, "Your password and confirmation password do not match")
      elsif errors.messages.blank?
        self.password = data[:password]
        return self.save(validates: false)
      end
    end
    return false
  end
  
end
