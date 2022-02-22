module Articles
  class ArticleMailerJob
    # include Sidekiq::Job

    queue_as :default

    def perform(article, admin, moderator)
      ArticleMailer.send_mail_about_end_moderation(article, admin, moderator).deliver_now
    end
  end
end
