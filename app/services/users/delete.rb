module Users
  class Delete < Service
    def initialize(id)
      @id = id
    end

    def call
      raise ServiceException.new("Some error delete") unless user.delete

    end

    private

    # Find user
    # @return[User]
    def user
      user = User.find_by(id: @id)
      raise ServiceException.new("Cant find user with id[#{@id}]") unless user.present?
      user
    end
  end
end

