class User < ActiveRecord::Base
  has_many :booking
  has_many :leads
  belongs_to :department
  
  validates :username, :contact_number, :contact_number, :department_id, :presence => true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :vendors
  validates :email, :uniqueness => true
  validates :email, :email => true
  
  
  def self.search(opts)
    columns_condition = self.columns.inject([]) do |array, el|
      array << "lower(#{self.table_name}.#{el.name}) LIKE :keyword" if (el.type == :string or el.type == :text)
      p array
      array
    end
    
    users = self.all
    users = users.where(columns_condition.join(" OR "), keyword: "%#{opts[:keyword].downcase}%" ) if opts[:keyword] && opts[:keyword] != ""
   
    return users
  end
  
end
