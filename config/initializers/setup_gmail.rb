ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'rockfortreddiars.com',
  user_name:            'reddiarcommunity@gmail.com',
  password:             'reddiarcommunity@123',
  authentication:       'plain',
  enable_starttls_auto: true  }