module Categories
  # Save category to db
  # In your controller:
  #   # return type = category or raise ServiceException
  #   Categories::CategoryCreate.new(params).call
  class CategoryCreate < Service
    def initialize(params)
      @params = validate(params)
    end

    # Save category
    # @return[Category]
    def call
      category = Category.new(@params)

      raise ServiceException.new(category.errors.messages.to_sentence) unless category.save

      category
    end

    private

    # Validate params from post body
    #
    # @param[ActionController::Parameters]
    # @return[ActionController::Parameters]
    def validate(p)
      p.require(:categories).permit(:title, :parent_id)
    end
  end
end
