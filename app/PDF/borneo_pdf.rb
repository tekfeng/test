class BorneoPDF < Prawn::Document
  
  def initialize(options={}, customer = nil, lead = nil, booking = nil)
    super(options.merge({:page_layout => :portrait, :page_size => "A4", margin: 15}))
     define_grid(:columns => 12, :rows => 8, :gutter => 5)
     logo
     to_customer(customer)
     if lead       
       from_office(lead, true)
     elsif booking
       from_office(booking, false)
     end
       
     # grid.show_all
  end
  
  def logo
    grid([0,0], [0,4]).bounding_box do
      image "#{Rails.root}/app/assets/images/ab_logo.png", scale: 0.5, :position => 5
    end
  end  
  
  def to_customer(customer)
    grid([1,0], [1,4]).bounding_box do
      font_size(11)
      indent(15) do
        text "TO"
        text "#{customer.try(:name)}"
        text "#{customer.try(:email_address)}"
      end  
    end  
  end
  
  def from_office(lead_or_booking, is_lead)
    grid([0,7], [1,11]).bounding_box do
      move_down 5
      font_size(11)
      if is_lead
        if lead_or_booking.try(:office) == "Singapore Office"
          text "Singapore Sales Office"
          text "Amazing Borneo Travel & Events"
          text "Co. Reg. No. 53143855D TA Licence"
          text "No. 01847"
          text "511 Guillemard Rd #02-14 Grandlink Square Singapore 399849"
          text "tel: +65 6841 3009 fax: +65 6841 4009"
          text "mobile: +65 92979846"
          text "email: wanting@amazingborneo.com"
        else
          text "Malaysia Main Office"
          text "Amazing Borneo Tours & Events Sdn. Bhd."
          text "Co. Licence No. 827148-U MOCAT Licence"
          text "No. KPL/LN 5746"
          text "Lot 1-39, Star City North Complex,"
          text "1st Floor, Jalan Asia City, 88000,"
          text "Kota Kinabalu, Sabah, Malaysia"
          text "tel: +6088-448409 fax: +6088-448509"
          text "email: info@amazingborneo.com"
          text "website: www.Amazing-Borneo.com"
        end     
      else
        text "Malaysia Main Office"
        text "Amazing Borneo Tours & Events Sdn. Bhd."
        text "Co. Licence No. 827148-U MOCAT Licence"
        text "No. KPL/LN 5746"
        text "Lot 1-39, Star City North Complex,"
        text "1st Floor, Jalan Asia City, 88000,"
        text "Kota Kinabalu, Sabah, Malaysia"
        text "tel: +6088-448409 fax: +6088-448509"
        text "email: info@amazingborneo.com"
        text "website: www.Amazing-Borneo.com"
      end
    end  
  end  
  
end  
