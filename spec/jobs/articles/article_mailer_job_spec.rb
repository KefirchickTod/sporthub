require "rails_helper"

RSpec.describe Articles::ArticleMailerJob, type: :job do
  let!(:admin) { create(:user) }
  let!(:article) { create(:article) }
  let!(:moderator) { create(:user) }

  describe "#perform_async" do
    it "should send mail" do
      Articles::ArticleMailerJob.queue_as = :test
      expect {
        Articles::ArticleMailerJob.perform_async(article, admin, moderator)
      }.to have_enqueued_job
    end
  end
end
