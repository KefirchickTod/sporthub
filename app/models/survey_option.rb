class SurveyOption < ApplicationRecord
  belongs_to :survey, foreign_key: "surveys_id", primary_key: "id", optional: true # Why?
  has_many :survey_answers, foreign_key: "survey_options_id", primary_key: true
end
