module Surveys
  class Delete < Service
    # @param[Survey]
    def initialize(survey)
      @survey = survey
    end

    def call
      raise ServiceException.new("Get invalid survey format for delete") unless @survey.is_a?(Survey)

      @survey.destroy
    end
  end
end
