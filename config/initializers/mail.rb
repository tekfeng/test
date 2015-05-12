if Rails.env == 'development' 
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "smtp.gmail.com",
    :user_name => "alamatest@gmail.com",
    :password => "thepa55w0rd",
    :authentication => "plain",
    :enable_starttls_auto => true
  }
else
end
