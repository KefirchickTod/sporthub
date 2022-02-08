module Users
  module Authentication
    module Password
      class ConfirmationError < ServiceException
      end

      class CreatorPasswordResetSender < Service

        def initialize(email)
          @email = email
        end

        def call
          @user = find_user!

          raise ConfirmationError.new("Please confirm your email first.") unless confirmed?

          send!

        end

        private

        def confirmed?
          @user.confirmed?
        end

        # Send password reset email
        def send!
          @user.send_password_reset_email!
        end

        # Find use by email
        # If not find raise InvalidEmailError
        # @return[User]
        # @raise[Users::Authentication::Exceptions::InvalidEmailError]
        def find_user!
          user = User.find_by(email: @email)
          raise Users::Authentication::Exceptions::InvalidEmailError.new("If that user exists we've sent instructions to their email.") if user.nil?
          user
        end

      end
    end
  end
end

