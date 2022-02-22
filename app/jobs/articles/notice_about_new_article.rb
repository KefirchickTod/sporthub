module Articles
  class NoticeAboutNewArticle
    queue_as :default

    def perform(article, emails)
      emails.each do |email|
        ArticleMailer.about_new_article(article, email).deliver
      end
    end
  end
end
