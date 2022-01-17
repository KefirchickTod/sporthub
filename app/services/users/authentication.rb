module Users::Authentication
  # Register
  class Register < Service

    class BadRegisterParam < ArgumentError
    end

    def initialize(params)
      @params = validates(params)

    end

    def call
      @user = create_user

      if defined?(session)
        session[:user] = @user.id
      end

      @user
    end

    private

    # Create new users
    # @return[User]
    # @raise [BadRegisterParam]
    def create_user
      user = User.new(@params)

      raise BadRegisterParam.new("Cant create user, bad params") unless user.save

      user

    end

    # Validate input params from request
    def validates(p)
      p.require(:user).permit(:email, :password, :password_confirmation, :first_name)
    end
  end

end