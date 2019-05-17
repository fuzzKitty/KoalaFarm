class ApplicationMailer < ActionMailer::Base
  # CONFIGURE - from: value needs to be configured before deploying
  default from: 'from@example.com'
  layout 'mailer'
end
