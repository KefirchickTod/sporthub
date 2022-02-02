module Categories
  # Save form data to db
  # Use in controller
  #   # If bad id then raise StandardError
  #   # @type[Category] returned type
  #   Categories::CategoryUpdate.new(params[:id], params).call
  class Update < Service
    attr_reader :category

    # @param[Integer]
    # @param[Hash]
    def initialize(id, params)
      raise "Cant write nil id for update category" if id.nil?

      @id = id
      @params = params
    end

    # Update current category
    def call
      @category = find

      raise ServiceException.new("Incorrect parent id for category #{@params.parent_id}") unless correct_parent_id?
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

    def correct_parent_id?
      return true if @params[:parent_id].nil?
      Category.find_by(id: @params[:parent_id]).present?
    end


  end
end
