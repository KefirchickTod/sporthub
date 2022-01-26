module Users
  module Authentication
    class Register < Service
      class BadRegisterParam < ServiceException
      end

      def initialize(params, session)
        @params = validates(params)
        @session = session
      end

      def call
        @user = create_user

        if defined?(@session)
          @session[:user] = @user.id
        end

        send_confirmation!

        @user
      end

      private

      # Send confirmation to email
      def send_confirmation!
        Users::Authentication::Confirmation.new(@params[:email]).call
      end

      # Create new users
      # @return[User]
      # @raise [BadRegisterParam]
      def create_user
        user = user!
        raise BadRegisterParam.new("Cant create user, errors: #{user.errors.message}") unless user.save

        user
      end

      def user!
        raise "Email already exists" if User.find_by(email: @params[:email]).present?

        User.new(@params)
      end

      # Validate input params from request
      def validates(p)
        p.require(:user).permit(:email, :password, :password_confirmation, :first_name)
      end
    end
  end
end
