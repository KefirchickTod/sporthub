module Users
  module Teams
    class Delete < Service
      def initialize(user, id)
        @user = user
        @id = id
      end

      def call
        raise @user.errors.messages if @user.teams.delete(@id)
      end

      private

      def find_team(id)
        user.teams.find(id)
      end
    end
  end
end
