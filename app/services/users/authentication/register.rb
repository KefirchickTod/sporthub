module Users
  module Authentication
    class Register < Service
      class BadRegisterParam < ServiceException
      end

      class EmailExistException < ServiceException
      end

      def initialize(params, session)
        @params = params
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
        raise BadRegisterParam.new("Cant create user, errors: #{user.errors.message}") unless user.valid?
        user.save
        user
      end

      # Create new user object
      # If email already exists raise EmailExistException
      # @raise[EmailExistException]
      # @return[User]
      def user!
        raise EmailExistException.new("Email already exists") if User.find_by(email: @params[:email]).present?

        User.new(@params)
      end

    end
  end
end
