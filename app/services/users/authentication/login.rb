module Users
  module Authentication
    class Login < Service
      class InvalidPassword < ServiceException
      end

      def initialize(params, session)
        @params = validates(params)
        @confirmation_service = Users::Authentication::Confirmation.new(params)

        @session = session
      end

      # Standard method
      # @return[User]
      def call
        @user = find(@params[:email], @params[:password])

        if defined?(@session)
          @session[:user] = @user.id
        end

        # puts @user.confirmed?, confirmation?

        @user
      end

      private

      # Was user get confirmation email?
      # If false, show notice error
      # @return[Boolean]
      def confirmation?
        return false if @user.confirmed?
        @user.send_confirmation_email!
        true
      end

      # Find user by email
      # @return[User]
      def find(email, password)
        user = User.find_by(email: email)

        raise "Incorrect email" unless user.present?
        raise InvalidPassword.new("Invalid password") unless user.authenticate(password)

        user
      end

      # Get validated params
      # @return[ActionController]
      def validates(p)
        p.require(:user).permit(:email, :password)
      end
    end
  end
end
