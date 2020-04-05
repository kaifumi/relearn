require 'rails_helper'

RSpec.describe RelearnMailer, type: :mailer do
  describe 'send_when_plan_timing' do
    let(:mail) { RelearnMailer.send_when_plan_timing }

    it 'renders the headers' do
      expect(mail.subject).to eq('Send when plan timing')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
