class ArticleMailer < ApplicationMailer
  default from: User::MAILER_FROM_EMAIL
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.confirmation.subject

  # @param[Article] article
  # @param[String] email
  def about_new_article(article, email)
    @article = article

    mail to: email, subject: "Hello its new article"
  end

  # Send mai if moderator success refact  article
  #
  # @param[Article] article
  # @param[User] admin
  # @param[User] moderator
  def send_mail_about_end_moderation(article, admin, moderator)
    @article = article
    @admin = admin
    @moderator = moderator

    mail to: @admin.email, subject: "#{@moderator.full_name} success end moderation artcile "
  end
end
