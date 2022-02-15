class SurveysController < ApplicationController
  # Create answer
  # POST /answer
  def create
    Surveys::Answers::Create.new(option, current_user)

    redirect_to root_path, notice: "You voted successfully"
  end

  private

  def answer_params
    params.require(:survey_answer).permit(:answer)
  end

  def option
    SurveyOption.find(answer_params[:answer])
  end
end
