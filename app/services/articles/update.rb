module Articles
  class Update < Service
    def initialize(params, id)
      @params = params
      @article = find(id)
    end

    def call
      raise ServiceException.new("Cant find article for update") unless @article.present?

      raise @article.errors.full_messages.to_sentence unless @article.update(@params)
      # puts "Update article: #{@article.update(@params)}"
    end

    private

    # Find article by id
    # @return[Article]
    def find(id)
      Article.find_by(id: id)
    end
  end
end
