module Users
  module Authentication
    module Password
      class UpdatePasswordResetEmail < Service
        def initialize(token, password_params)
          @token, @password_params = token, password_params
        end

        def call
          @user = find_by_token

          raise ConfirmationError.new("You must confirm your email") unless unconfirmed?
          raise @user.errors.full_messages unless @user.update(@password_params)

          @user
        end

        private

        def unconfirmed?
          user.unconfirmed?
        end

        # Find user by
        # Use from PasswordController for methods edit|update
        # @return[User]
        def find_by_token
          user = User.find_signed(@token, purpose: :reset_password)
          raise TokenExpiredException.new("Invalid or expired token.") unless user
        end
      end
    end
  end
end
