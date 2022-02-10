class SurveyAnswer < ApplicationRecord
  belongs_to :survey_option, foreign_key: "survey_options_id", primary_key: "id"
end
