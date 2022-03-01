module Articles
  class EveryDayJob
    include Sidekiq::Job

    def perform
      users = User.subscribed

      users.each do |user|
        teams = user.teams

        next if teams.nil? || teams.empty?

        params = articles(teams)

        next if params.empty?

        ArticleEveryDayMailer.mailer(params, user.email)
      end
    end

    private

    # Get all newest article from current group of teams
    # @param[Array[Hash]] teams
    # @return[Array[Hash]]
    def articles(teams)
      articles = []

      teams.each do |team|
        article = team.newest_article.first
        articles << article.as_json unless article.nil?
      end

      articles
    end
  end
end
