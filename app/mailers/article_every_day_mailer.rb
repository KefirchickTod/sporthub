class ArticleEveryDayMailer < ApplicationMailer
  default from: User::MAILER_FROM_EMAIL

  # Send article or only one article to email
  # @param[Array[Hash]] articles get as json
  # @param[String] email
  def mailer(articles, email)
    @articles = articles

    mail to: email, subject: "Hello its new article"
  end
end
