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

  # Login service
  class Login < Service
    def initialize(params)
      @params = validates(params)
    end

    # Standard method
    def call
      @user = find(@params[:email])

      raise "Cant find user by email" unless @user.present?

      if defined?(session)
        session[:user] = @user.id
      end

      @user
    end

    private

    # Find user by email
    # @return[User]
    def find(email)
      User.find_by(email: email)
    end

    # Get validated params
    # @return[ActionController]
    def validates(p)
      p.require(:user).permit(:email, :password)
    end
  end
end
