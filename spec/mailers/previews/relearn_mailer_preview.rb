# Preview all emails at http://localhost:3000/rails/mailers/relearn_mailer
class RelearnMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/relearn_mailer/send_when_plan_timing
  def send_when_plan_timing
    RelearnMailer.send_when_plan_timing
  end
end
