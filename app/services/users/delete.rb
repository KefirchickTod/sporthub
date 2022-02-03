module Users
  class Delete < Service
    def initialize(id)
      @id = id
    end

    def call
      user = find_user

      #   allow = block_given? ? yield(user) : false

      #raise ServiceException.new("You cant delete this user") unless allow
      raise ServiceException.new("Some error delete") unless user.destroy

    end

    private

    # Find user
    # @return[User]
    def find_user
      user = User.find_by(id: @id)
      raise ServiceException.new("Cant find user with id[#{@id}]") unless user.present?
      user
    end
  end
end

