module Articles
  class ArticleDelete < Service
    def initialize(id)
      @id = id
    end

    def call
      @article = find

      raise "Cant find article for delete" unless @article || @article.present?
      raise "Error to delete" unless @article.destroy
    end

    private

    def find
      Article.find(@id)
    end
  end
end
