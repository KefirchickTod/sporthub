class SurveyOption < ApplicationRecord
  belongs_to :survey, foreign_key: "surveys_id", primary_key: "id", optional: true # Why?
  has_many :survey_answers, foreign_key: "survey_options_id", primary_key: true

  before_destroy :clean_all_answers

  private

  def clean_all_answers
    survey_answers.each do |survey|
      survey.destroy
    end
  end
end
