module Users
  module Authentication
    class Confirmation < Service
      def initialize(email)
        @email = email
      end

      # Run service
      def call
        @user = find_user

        raise ServiceException.new("cant find user by email [#{@email}]") unless @user.present?

        send_confirmation
      end

      private

      # Find user by email
      # @return[User]
      def find_user
        @user = User.find_by(email: @email)
      end

      # Send mail to user email with confirm token
      def send_confirmation
        return unless @user.unconfirmed?

        @user.send_confirmation_email!
      end
    end
  end
end
