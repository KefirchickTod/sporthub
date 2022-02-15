module Users
  module Authentication
    module Password
      class TokenExpiredException < ServiceException; end

      class EditorPasswordResetEmail < Service
        def initialize(password_reset_token)
          @token = password_reset_token
        end

        def call
          @user = find_by_token
        end

        private

        # Find user by
        # Use from PasswordController for methods edit|update
        # @return[User]
        def find_by_token
          user = User.find_signed(@token, purpose: :reset_password)
          raise ServiceException.new("You must confirm your email before you can sign in.") if user.present? && user.unconfirmed?
          raise TokenExpiredException.new("Invalid or expired token.") unless user
        end
      end
    end
  end
end
