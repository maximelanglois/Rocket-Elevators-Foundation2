# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  
    :user_name => Rails.application.credentials.send_grid[:user],
    :password => Rails.application.credentials.send_grid[:pass],
    :domain => Rails.application.credentials.send_grid[:will_domain],
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
    
  }
