class Articles::ArticleCreate < Service
  # @param[ActionController]
  # @param[Integer]
  def initialize(params, user_id)
    @params = validates(params)
    @user_id = user_id
  end

  # Save article data
  # @return[Article]
  def call
    article = Article.new(@params)

    article.users_id = @user_id

    # raise article.is_public.to_s

    raise article.errors.full_messages.to_sentence unless article.save

    article
  end

  private

  def validates(p)
    p.require(:article).permit(
      :title,
      :full_text,
      :short_text,
      :categories_id,
      :is_public,
      :default_photo
    )
  end
end
