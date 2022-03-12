class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@banana.com'
  layout 'mailer'
end
