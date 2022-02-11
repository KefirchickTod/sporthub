module Users
  module Teams
    class Create < Service
      # @param[User]
      # @param[Hash]
      def initialize(user, params)
        @user = user
        @params = params
      end

      def call
        validate

        @params.each do |id|
          team = Team.find(id)
          raise ServiceException.new("Cant find team with #{id}") unless team.present?
          @user.teams << team
        end
      end

      private

      def validate
        @params = @params.is_a?(Array) ? @params : [@params]
        raise ServiceException.new("Cant save empty teams") if @params.empty?
      end
    end
  end
end
