class Customer < ActiveRecord::Base
  belongs_to :country 
  belongs_to :source
  
  has_many :bookings
  has_many :leads
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :email_address, :presence => true
  validates :email_address, :uniqueness => true
  validates :contact_number, :presence => true
  validates :contact_number, :uniqueness => true
  validates :address, :presence => true
  validates :address, :uniqueness => true
  validates :country_id, :presence => true
  validates :source_id, :presence => true
  
  def as_json(options={})
    {
      id: id,
      name: name,
      email_address: email,
      contact_number: contact,
      address: address,
      country_id: country ? country.name : "N/A",
      source_id: source ? source.name : "N/A"
    }
  end
  
  def self.search(opts)
    columns_condition = self.columns.inject([]) do |array, el|
      array << "lower(#{self.table_name}.#{el.name}) LIKE :keyword" if (el.type == :string or el.type == :text)
      array
    end
    page = opts[:page] ? opts[:page].to_i : 1
    customers = self.all
    customers = customers.where(columns_condition.join(" OR "), keyword: "%#{opts[:keyword].downcase}%" ) if opts[:keyword] && opts[:keyword] != ""
    customers = customers.where("customers.country_id = ?", opts[:country_id].to_i) if opts[:country_id] && opts[:country_id].to_i != 0
    customers = customers.where("customers.source_id = ?", opts[:source_id].to_i) if opts[:source_id] && opts[:source_id].to_i != 0
    # customers = customers.page(page).per(10)
    return {customers: customers, total_page: 1, current_page: page}
  end
end
