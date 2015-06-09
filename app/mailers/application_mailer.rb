class ApplicationMailer < ActionMailer::Base
  default from: APP_CONFIG[:email_sender]
  
  def send_quotation_pdf(email, pdf)
    # @customer = customer
    @email = email
    attachments["quotation.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => email , :subject => "[Amazing Borneo] Quotation")
  end
  
  def send_invoice_pdf(email, pdf)
    @email = email
    attachments["invoice.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => email , :subject => "[Amazing Borneo] Invoice")
  end
  
  def send_ltinerary_pdf(email, pdf)
    @email = email
    attachments["itinerary.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => email , :subject => "[Amazing Borneo] Itinerary")
  end  
      
end
