class ApplicationMailer < ActionMailer::Base
  default from: APP_CONFIG[:email_sender]
  
  def send_quotation_pdf(customer, pdf)
    @email = customer.email_address
    @name = customer.name
    attachments["quotation.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => @email , :subject => "[Amazing Borneo] Quotation")
  end
  
  def send_invoice_pdf(email, pdf)
    @email = email
    attachments["invoice.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => email , :subject => "[Amazing Borneo] Invoice")
  end
  
  def send_ltinerary_pdf(customer, pdf)
    @email = customer.email_address
    @name = customer.name
    attachments["itinerary.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => @email , :subject => "[Amazing Borneo] Itinerary")
  end 
  
  def welcome_user(user, password)
    @user = user
    @url = "#{APP_CONFIG[:domain]}"
    @password = password
    mail(to: @user.email, subject: 'Welcome to Amazing Borneo')
  end
  
   
      
end
