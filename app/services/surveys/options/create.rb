module Surveys
  module Options
    class EmptyOptionsException < ServiceException; end

    # Allow to create multiple option to survey
    # Params for options:
    #   params = [
    #     {
    #       answer: "Options answer"
    #     }
    #   ]
    #
    # Usage:
    #   survey = Survey::Create.new(params).call
    #   Survey::Options::Create.new(survey, option_params).call
    #
    class Create < Service
      def initialize(survey, params)
        @survey = survey
        @params = params
      end

      def call
        raise EmptyOptionsException.new("Cant save survey with empty options") if @params.nil? || @params.empty?

        @params.each do |option|
          SurveyOption.create(
            surveys_id: survey_id,
            answer: option
          )
        rescue => e
          raise ServiceException.new(e.to_s)
        end
      end

      private

      # @return[Integer]
      def survey_id
        @survey.id
      end
    end
  end
end
