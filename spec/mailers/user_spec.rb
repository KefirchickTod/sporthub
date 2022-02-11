require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "confirmation" do
    let!(:user) { create(:user) }
    let(:mail) { UserMailer.confirmation(user, user.generate_confirmation_token) }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirmation Instructions")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["no-reply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Confirmation Instructions")
    end
  end
end
