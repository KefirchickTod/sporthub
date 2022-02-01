module Articles
  class Create < Service
    # @param[ActionController]
    # @param[Integer]
    def initialize(params, user_id)
      @params = params
      @user_id = user_id
    end

    # Save article data
    # @return[Article]
    def call
      article = Article.new(@params)

      article.users_id = @user_id

      # raise article.is_public.to_s

      raise ServiceException.new(article.errors.full_messages.to_sentence) unless article.save

      article
    end

  end
end
