module Users
  module Teams
    class Delete < Service
      def initialize(user, id)
        @user = user
        @id = id
      end

      def call
        raise @user.errors.messages unless @user.teams.delete(@id)
      end
    end
  end
end
