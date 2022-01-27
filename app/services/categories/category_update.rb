module Categories
  # Save form data to db
  # Use in controller
  #   # If bad id then raise StandardError
  #   # @type[Category] returned type
  #   Categories::CategoryUpdate.new(params[:id], params).call
  class CategoryUpdate < Service
    attr_reader :category

    # @param[ActionController::Parameters]
    def initialize(id, params)
      raise "Cant write nil id for update category" if id.nil?

      @id = params[:id]
      @params = validate(params)
    end

    # Update current category
    def call
      @category = find
      raise @category.errors.messages.to_sentence unless @category.update(@params)

      @category
    end

    private

    # @return[Category]
    def find
      Category.find(@id)
    rescue => e
      raise ServiceException.new(e.to_s)
    end

    # @param[ActionController::Parameters]
    def validate(p)
      p.require(:category).permit(:title, :parent_id)
    end
  end
end
