class QuotationPDF < BorneoPDF
  
  def initialize(options={}, customer = nil , lead= nil )
    super(options, customer, lead, nil )
     basic_information(customer, lead)
     detail_information(customer , lead)
     how_to_book
     advertisement
     reminder
  end
  
  def basic_information(customer, lead)
    span(500, :position => :center) do
      grid([2,0], [2,10]).bounding_box do
        indent(0) do
          formatted_text [{text: "QUOTATION", styles: [:bold], size: 16}]
          move_down 5
          text "AB#{sprintf('%05d', lead.id)}"
          move_down 5
          text "Date: #{lead.created_at.strftime('%d-%m-%Y')}"
          move_down 5
          text "Prepared by: #{lead.user.try(:username)}"
        end 
        move_down 10
        dash(1, space: 1, phase: 0)
        stroke_horizontal_line 0, 500
        undash      
      end
    end
  end  
  
  
  def detail_information(customer, lead)
    span(500, :position => :center) do
      move_down 10
      header = ["No", "Description", "Cost per pax"]
      data = []  
      data << header 
    
      lead.lead_tour_category_tours.each_with_index do | lead_tour , index|
        tour = lead_tour.tour
        content_data  =[]
        content_data << ["TOUR NAME: #{tour.try(:name)}"]
        content_data << ["TOUR CODE: #{tour.try(:code)}"]
        content_data << ["DATE: #{lead.travel_from.strftime('%d-%B-%Y')}"]
        content_data << ["DURATION: 4D3N"]
        content_data << ["MEALS: 03 Breakfasts, 01 Lunch"]
        content_data << [" "]
        content_data << ["Includes: "]
        content_data << ["• Return Airport Transfers in clean, comfortable SIC (Seat In Coach)"]
        content_data << ["• All Meals as stated in Itinerary"]
        content_data << ["• Rafting equipment, Life Jacket, Rafting Insurance"]
        content_data << ["• 01 River Guide (For White Water Rafting)"]
        content_data << ["• 01 MMA Session with Sabahan One FC Fighters"]
        content_data << ["• 01 English-speaking licensed Tour guide"]
        content_data << ["• All Land transportation as part of the tours"]
        content_data << [" "]
        content_data << ["Accommodation : 03 Nights Accommodation in 3 Star City Hotel (Twin- sharing)"]
        content_data << [" "]
        content_table = make_table(content_data, width: 400) do
          cells.style do |c|
            c.border_color = 'FFFFFF'
            c.border_width = 0
            c.padding = [5,0,0,5]
            if c.row <= 4 
              c.font_style = :bold
              c.size = 12
            end  
          end
        end  
        row1 = ["#{index + 1}", content_table, ""]
        data << row1
      end
      cost_row = ["", "Cost per person (Minimum 2 pax)", {content: "MYR690", align: :right}]
      data << cost_row
      table(data, :width => 500, :cell_style =>  {:size => 12}, :column_widths => [40,400,60], :position => 0 ) do
        cells.style do |c|
        
          if c.row == 0 
            c.background_color = '2E3091'
            c.text_color = "FFFFFF"
          end
          c.border_color = '2E3091'  
      
          if c.row == data.size - 1
            c.font_style = :bold
          end     
        end
      end  
    end
  end
  
  def how_to_book
    start_new_page
    
    span(500, :position => :center) do
      move_down 20
      formatted_text [{text: "HOW TO BOOK", styles: [:bold], size: 16}]
      move_down 10
      text "Kindly get back to us ASAP for immediate reservations and guaranteed bookings once we have informed you on the availability."
      move_down 15
      text "a) 50% Deposit payment required within 5 days upon receiving invoice for securing of accommodation."
      move_down 15
      text "50% BALANCE payment will be required 1 month before tour date"
      text "OR"
      move_down 15
      text "b) Full payment within 3 days upon receiving invoice for booking of tours within 1 month of the travel date."
      move_down 15
      formatted_text [{text: "INFORMATION ABOUT PAYMENT:", styles: [:bold]}]
      move_down 10
      text "We accept payments by cash, credit card or bank transfer."
      move_down 20
      dash(1, space: 1, phase: 0)
      stroke_horizontal_line 0, 500
      undash    
    end
     
  end  
  
  def advertisement
    span(500, :position => :center) do
      move_down 20
      formatted_text [{text: "WHY SHOULD I CLIMB WITH AMAZING BORNEO TOURS?", styles: [:bold]}]
      move_down 10
      text "1. We Are the Licensed Land Tour Operator in Malaysia & Licensed Travel Agent in Singapore."
      text "2. We Are Supported By MATTA, SABAH TOURISM BOARD & SINGAPORE TOURISM BOARD."
      text "3. We Are ISO 9001 certified for Quality Management System – this Guarantees that YOUR Booking and Climb is handled with Proper Procedures of the Highest Standard."
      text "4. We use Legal & Licensed Climb Permits by Sabah Parks Authority."
      text "5. We Are the Mount Kinabalu Mountain People."
      text "6. We Handle Thousands of Climbers from Around the World Every Year."
      text "7. We Have Multiple Daily Departures To & Fro between Kinabalu Park and Kota Kinabalu City Centre."
      text "8. We Have our Head Office In Kota Kinabalu City Centre, Contingency Base In Kinabalu Park and At The Foot Of Mount Kinabalu, and our Sales Office in Singapore."
      text "9. We Have A Strong Network with the Locals, Hoteliers, & Suppliers in Borneo."
      text "10. Your Safety is Always our Highest Priority."
      text "11. We Are Able To Handle Crisis & Emergencies Efficiently"
      text "12. We Dedicate Mountain Guides for Your Group Only – No Co-Sharing With Other Climbers So You Can Trek At Your Own Pace."
      text "13. Our Mountain Guides are Carefully Selected and First-Aid trained."
      text "14. We Provide Clean and Reliable Vehicles for You to Travel Comfortably."
      text "15. Our Climb Packages Rates Are Most Competitive With High Standard Service Quality"
      text "16. No Hidden or Extra Costs in Our Pricing."
      text "17. We Provide the Latest Updates Of Mount Kinabalu’s Weather Conditions Accurately."
      text "18. We are Committed to Responsible Tourism."
      text "19. We Provide Personalized & Dedicated Services – your Mount Kinabalu climb trip can be tailor- made to include Other Tours & Accommodation in the Whole of Sabah."
      text "20. Come Join Us & Start Your Mount Kinabalu Adventure With Us Today!"
    end
  end    
  
  def reminder
    span(500, :position => :center) do
      move_down 20
      text "NO BOOKING has been made at this moment."
      text "Once I have received your confirmation, we will make reservations and invoice will be issued thereafter."
    end
  end  
  
end  
