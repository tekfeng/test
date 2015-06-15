class ItineraryPDF < BorneoPDF
  
  def initialize(options={}, customer = nil, booking = nil )
     super(options, customer)
     basic_information(booking)
  end
  
  def basic_information(booking)
    grid([2,0], [2,10]).bounding_box do
      indent(10) do
        formatted_text [{text: "Itinerary", styles: [:bold], size: 16}]
        move_down 5
        text "Itinerary: AB#{sprintf('%05d', booking.id)}"
        move_down 5
        text "Date: #{booking.travel_date.strftime('%d-%m-%Y')}"
        move_down 5
        text "Prepared by:  #{booking.user.try(:username)}"
      end 
      move_down 10
      dash(1, space: 1, phase: 0)
      stroke_horizontal_line 10, 540
      undash      
    end
  end  
end  

