class Customer < ActiveRecord::Base
  belongs_to :country 
  belongs_to :source
  
  has_many :bookings
  has_many :leads
  
  validates :email_address, :name, :uniqueness => true
  # validates :email_address, :email => true 
  validates :name, :contact_number, :address, :country_id, :source_id, :presence => true
  
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
    customers = self.all
    customers = customers.where(columns_condition.join(" OR "), keyword: "%#{opts[:keyword].downcase}%" ) if opts[:keyword] && opts[:keyword] != ""
    customers = customers.where("customers.country_id = ?", opts[:country_id].to_i) if opts[:country_id] && opts[:country_id].to_i != 0
    customers = customers.where("customers.source_id = ?", opts[:source_id].to_i) if opts[:source_id] && opts[:source_id].to_i != 0
    return customers
  end
end
