class DashboardController < BaseController
  
  def index    
    render template: "dashboard/index", layout: "index_page"
  end
  
  def quotation
    @lead = Lead.last
    send_data(QuotationPDF.new({}, @lead.customer, @lead).render, filename: 'quotation.pdf', disposition: :inline, stream: true, :type => "application/pdf")
  end
  
  def itinerary
    send_data(ItineraryPDF.new.render, filename: 'Itinerary.pdf', disposition: :inline, stream: true, :type => "application/pdf")
  end
  
  def invoice
    send_data(InvoicePDF.new.render, filename: 'invoice.pdf', disposition: :inline, stream: true, :type => "application/pdf")
  end    

end
