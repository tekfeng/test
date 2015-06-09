class InvoicePDF < BorneoPDF
  
  def initialize(options={}, customer = nil)
     super(options, customer)
     basic_information
     detail_information
  end
  
  def basic_information
    grid([2,0], [2,10]).bounding_box do
      indent(10) do
        formatted_text [{text: "INVOICE", styles: [:bold], size: 16}]
        move_down 5
        text "Invoice: AB0001"
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
  
  
  def detail_information
    move_down 10
    header = ["Description", "Price Per", "Qty", "Amount"]
    data = []  
    data << header
    
    #tour name , #tour code
    
    content_data  =[]
    content_data << ["TOUR NAME: <tour name>"]
    content_data << ["TOUR CODE: <tour code>"]
    content_data << ["DATE: <date>"]
    content_data << ["DURATION: <duration>"]
    content_data << ["MEALS: <meals>"]
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
    content_table = make_table(content_data, width: 350) do
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
    row1 = [content_table, {content: "690", align: :right}, {content: "2", align: :right}, {content: "1380", align: :right}]
    cost_row1 = [{content: "Exclusive of GST", align: :right, colspan: 3}, {content: "1380.00", align: :right}]
    cost_row2 = [{content: "GST @ 6.0% RM", align: :right, colspan: 3}, {content: "82.80", align: :right}]
    cost_row3 = [{content: "Total RM", align: :right, colspan: 3}, {content: "1462.80", align: :right}]
    data << row1
    data << cost_row1
    data << cost_row2
    data << cost_row3
    
    table(data, :width => 530, :cell_style =>  {:size => 12}, :column_widths => [350,60,40,80], :position => 10 ) do
        cells.style do |c|
          if c.row == 0 
            c.background_color = '2E3091'
            c.text_color = "FFFFFF"
          end
          c.border_color = '2E3091'  
          if c.row >= data.size - 3 
            c.font_style = :bold
          end     
        end
      end  
  end
  
  
end  
