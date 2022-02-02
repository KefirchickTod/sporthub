module Categories
  class Delete < Service
    def initialize(id)
      @id = id
    end

    # @return[Category]
    def call
      # @type[Category]
      @category = find

      raise @category.errors.messages.to_sentence unless @category.delete

      @category
    end

    private

    # Find category by id
    # @return[Category]
    def find
      Category.find(@id)
    rescue => e
      raise ServiceException.new(e.to_s)
    end
  end
end
