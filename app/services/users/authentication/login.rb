module Users
  module Authentication
    class Login < Service
      class InvalidPassword < ServiceException
      end

      def initialize(params, session = nil)
        @params = params
        @confirmation_service = Users::Authentication::Confirmation.new(params)

        @session = session
      end

      # Standard method
      # @return[User]
      def call
        @user = find(@params[:email], @params[:password])

        write_to_session(@user.id)
        # puts @user.confirmed?, confirmation?

        @user
      end

      private

      # Write user id to session
      def write_to_session(id)
        if @session
          @session[:user] = id # todo init symbol :user as global constant
        end
      end

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
        puts "\nEmail: #{email}"
        raise ServiceException.new("Incorrect email") unless user.present?
        raise InvalidPassword.new("Invalid password") unless user.authenticate(password)

        user
      end
    end
  end
end
