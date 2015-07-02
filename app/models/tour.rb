class Tour < ActiveRecord::Base
  belongs_to :tour_category
    
  has_many :booking_tour_category_tours, dependent: :destroy
  has_many :lead_tour_category_tours, dependent: :destroy
  
  validates :name, :code, :price_per_person, :min_number_pax, :tour_category_id, :presence => true
  validates :name, :code,  :uniqueness => true
  validate :min_number_pax, :check_number, :if => :min_number_pax_not_blank
  
  
  def min_number_pax_not_blank
    self.min_number_pax != ""
  end
  
  def check_number
    if self.min_number_pax.to_i < 0
      errors.add(:min_number_pax, "Invalid number")
      return false
    end
  end
  
  def as_json(options={})
    {
      id: id,
      name: name,
      code: code,
      tour_category: tour_category ? tour_category.name : "N/A"
    }
  end
  
  def self.search(opts)
    columns_condition = self.columns.inject([]) do |array, el|
      array << "lower(#{self.table_name}.#{el.name}) LIKE :keyword" if (el.type == :string or el.type == :text)
      array
    end
    page = opts[:page] ? opts[:page].to_i : 1
    tours = self.all
    tours = tours.where(columns_condition.join(" OR "), keyword: "%#{opts[:keyword].downcase}%") if opts[:keyword] && opts[:keyword] != ""
    tours = tours.where("tours.tour_category_id = ?", opts[:tour_category_id].to_i) if opts[:tour_category_id] && opts[:tour_category_id].to_i != 0
    # tours = tours.page(page).per(10)
    return {tours: tours, total_page: 1, current_page: page}
  end
  
  def as_json(for_="")
    case (for_)
    when "selectbox"
      {
        id: self.id,
        name: self.name
      }
    else
      self
    end
  end
  
  
end
