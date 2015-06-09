class ItineraryPDF < BorneoPDF
  
  def initialize(options={}, customer = nil)
     super(options, customer)
     basic_information
  end
  
  def basic_information
    grid([2,0], [2,10]).bounding_box do
      indent(10) do
        formatted_text [{text: "Itinerary", styles: [:bold], size: 16}]
        move_down 5
        text "Itinerary: AB0001"
        move_down 5
        text "Date: <sent date>"
        move_down 5
        text "Prepared by: <Sales Person>"
      end 
      move_down 10
      dash(1, space: 1, phase: 0)
      stroke_horizontal_line 10, 540
      undash      
    end
  end  
end  

