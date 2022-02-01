module Articles
  class Update < Service

    def initialize(params)
      @params = params
      @article = find(params[:id])
    end

    def call
      raise ServiceException.new('Cant find article for delete') unless @article.present?

      raise @article.errors.full_messages.to_sentence unless @article.update(@params)
    end

    private

    # Find article by id
    # @return[Article]
    def find(id)
      Article.find_by(id: id)
    end
  end
end
