class BorneoPDF < Prawn::Document
  
  def initialize(options={}, customer = nil)
    super(options.merge({:page_layout => :portrait, :page_size => "A4", margin: 5}))
     define_grid(:columns => 12, :rows => 8, :gutter => 5)
     logo
     to_customer
     from_office
     # grid.show_all
  end
  
  def logo
    grid([0,0], [0,4]).bounding_box do
      image "#{Rails.root}/app/assets/images/ab_logo.png", scale: 0.5, :position => 5
    end
  end  
  
  def to_customer
    grid([1,0], [1,4]).bounding_box do
      font_size(11)
      indent(15) do
        text "TO"
        text "<Customer Name>"
        text "<Email address>"
      end  
    end  
  end
  
  def from_office
    grid([0,7], [1,11]).bounding_box do
      move_down 5
      font_size(11)
      text "Malaysia Main Office"
      text "Amazing Borneo Tours & Events Sdn. Bhd. Co. Licence No. 827148-U MOCAT Licence No. KPL/LN 5746
      Lot 1-39, Star City North Complex,
      1st Floor, Jalan Asia City, 88000,
      Kota Kinabalu, Sabah, Malaysia"
      text "tel: +6088-448409 fax: +6088-448509"
      text "email: info@amazingborneo.com"
      text "website: www.Amazing-Borneo.com"
    end  
  end  
  
end  
