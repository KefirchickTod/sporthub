module Admin
  class SurveysController < AdminController
    before_action :find_survey, only: %i[edit update destroy]
    # GET /admin/surveys
    def index
      @pagy, @surveys = pagy(Survey.all)
    end

    # GET /admin/surveys/new
    def new
      @survey = Survey.new
    end

    # POST /admin/surveys/create
    def create
      Surveys::Create.new(surveys_params).call
      redirect_to admin_surveys_url
    end

    # GET /admin/surveys/:id/edit
    def edit
      @survey = Survey.find(params[:id])
    end

    # PATCH  /admin/surveys/:id
    def update
    end

    def destroy
      Surveys::Delete.new(@survey).call
    end

    private

    def surveys_params
      surveys = params.require(:survey)
      {
        options: surveys[:options]
      }.merge!(surveys.permit(:question, :active_from, :active_to))
    end

    def find_survey
      @survey = params.has_key?(:id) ? Survey.find(params[:id]) : Survey.new
    end
  end
end
