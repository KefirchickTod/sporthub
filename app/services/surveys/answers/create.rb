module Surveys
  module Answers
    class Create < Service
      # @param[SurveyOption]
      # @param[User] Current user
      def initialize(option, user)
        @option = option
        @user = user
      end

      def call
        validate
        SurveyAnswer.create(
          users_id: @user.id,
          survey_options_id: @option.id,
          surveys_id: surveys_id
        )
      end

      private

      def validate
        raise ServiceException.new("Invalid option") unless @option.is_a?(SurveyOption)
        raise ServiceException.new("Invalid user") unless @option.is_a?(User)
      end

      def surveys_id
        @option.survey.id
      end
    end
  end
end
