class DashboardController < BaseController
  def index
    
  end
  
  def quotation
    send_data(QuotationPDF.new.render, filename: 'quotation.pdf', disposition: :inline, stream: true, :type => "application/pdf")
  end
  
  def itinerary
    send_data(ItineraryPDF.new.render, filename: 'Itinerary.pdf', disposition: :inline, stream: true, :type => "application/pdf")
  end
  
  def invoice
    send_data(InvoicePDF.new.render, filename: 'invoice.pdf', disposition: :inline, stream: true, :type => "application/pdf")
  end    
end
