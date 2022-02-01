module Users
  class UserUpdate
    def initialize(id, params)
      @id = id
      @params = @params[:user]
    end

    # Update user
    # @return[User]
    def call
      @user = find

      raise ServiceException.new("Cant find user with id: [#{@id}]") unless @user.present?

      raise ServiceException.new("Cant update user with id [#{id}]") unless @user.update(@params)

      @user
    end

    private

    # @return[User]
    def find
      User.find(@id)
    end

    def validate(p)
      p.require(:user).permit(:first_name, :second_name)
    end
  end
end
