if ["test", "development"].index(Rails.env.to_s).nil?
  Rails.application.config.middleware.use ExceptionNotifier,
    :email_prefix => "[Borneo] ",
    :sender_address => APP_CONFIG[:email_sender],
    :exception_recipients => %w{james@rubify.com khoatran@rubify.com musshi@rubify.com}
end