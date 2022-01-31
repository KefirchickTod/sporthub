module Categories
  class CategoryDelete < Service
    def initialize(id)
      @id = id
    end

    # @return[Boolean]
    def call
      # @type[Category]
      @category = find

      raise @category.errors.messages.to_sentence unless @category.delete

      @category.destroyed?
    end

    private

    def remove_articles
      # remove all conecnter articles
    end

    # Find category by id
    # @return[Category]
    def find
      Category.find(@id)
    rescue => e
      raise ServiceException.new(e.to_s)
    end
  end
end
