class Articles::ArticleUpdate < Service
  def initialize(params)
    @params = validates(params)
    @article = find(params[:id])
  end

  def call
    raise "404" unless @article.present?

    raise @article.errors.full_messages.to_sentence unless @article.update(@params)
  end

  private

  # Find article by id
  # @return[Article]
  def find(id)
    Article.find(id)
  end

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
