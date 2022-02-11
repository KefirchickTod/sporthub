module Teams
  class Create < Service
    def initialize(params)
      @params = params
    end

    # Create new team by outer params
    # @return[Team]
    def call
      raise ServiceException.new("Not unique title for team #{@params[:title]}") unless unique?
      Team.create(@params)
    end

    private

    # Check if unique team title
    # @return[Boolean]
    def unique?
      !Team.find_by(title: @params[:title]).present?
    end
  end
end
