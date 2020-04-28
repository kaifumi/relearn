class ApplicationMailer < ActionMailer::Base
  default from: 'ReLearn',
          bcc: 'kafu844@gmail.com',
          reply_to: 'kafu844@gmail.com'
  layout 'mailer'
end
