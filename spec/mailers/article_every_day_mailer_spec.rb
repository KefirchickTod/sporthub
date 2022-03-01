require "rails_helper"

RSpec.describe ArticleEveryDayMailer, type: :mailer do
  describe "#mailer" do
    let(:articles) { [build(:article).as_json, build(:article).as_json] }
    let(:email) { build(:user).email }

    let(:mail) { ArticleEveryDayMailer.mailer(articles, email) }

    it "should send mail to email " do
      expect(mail.subject).to eq("Hello its new article")
      expect(mail.to).to eq([email])
      expect(mail.from).to eq(["no-reply@example.com"])
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
