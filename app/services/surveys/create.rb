module Surveys
  class Create < Service
    def initialize(params)
      @params = params
    end

    # Save survey and options
    # If save options raise error  Rollback all changes
    def call
      options = get_options

      survey = Survey.new(@params)

      raise ServiceException.new(survey.errors.messages) unless survey.save

      Survey.transaction do
        save_options(survey, options)
      rescue => e
        raise ActiveRecord::Rollback.new(e.to_s)
      end

      survey
    end

    private

    # Get attribute for options
    # @return[Array]
    def get_options
      options = @params[:options]
      raise ServiceException.new("Cant save survey with empty options") if options.nil? || options.empty?

      @params.delete(:options)

      options
    end

    # Save options
    def save_options(survey, options)
      Surveys::Options::Create.new(survey, options).call
    end
  end
end
