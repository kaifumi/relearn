class ApplicationMailer < ActionMailer::Base
  default from: 'ReLearn',
          bcc: 'kafu844@gmail.com', # 捨て垢
          reply_to: 'kafu844@gmail.com'
  layout 'mailer'
end
