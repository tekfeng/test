if Rails.env != 'test'
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "rubify.com",
    :user_name => "noreply@rubify.com",
    :password => "pa55w0rd1234",
    :authentication => "plain",
    :enable_starttls_auto => true
  }
end