module Users
  class Update < Service

    def initialize(id, params, image = nil)
      @params = params
      @id = id
      @image = image
    end

    def call
      @user = find_user

      raise ServiceException.new(@user.errors.messages) unless @user.update(@params)

      if @image
        @user.image.attach(@image)
      end

      @user
    end

    private

    # Get user, not exists then raise ServiceError
    # @return[User]
    def find_user
      user = User.find_by(id: @id)
      raise ServiceException.new("Cant find user with id[#{@id}]") unless user.present?
      user
    end

  end
end