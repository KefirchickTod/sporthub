module Categories
  # Save category to db
  # In your controller:
  #   # return type = category or raise ServiceException
  #   Categories::CategoryCreate.new(params).call
  class Create < Service
    def initialize(params)
      @params = params
    end

    # Save category
    # @return[Category]
    def call
      category = Category.new(@params)

      raise ServiceException.new("Incorrect parent id for category #{@params.parent_id}") unless correct_parent_id?
      raise ServiceException.new(category.errors.messages) unless category.save

      category
    end

    private

    def correct_parent_id?
      return true if @params[:parent_id].nil?
      Category.find_by(id: @params[:parent_id]).present?
    end

  end
end

