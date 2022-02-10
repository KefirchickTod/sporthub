class SurveyOption < ApplicationRecord
  belongs_to :survey, foreign_key: 'surveys_id', primary_key: 'id', optional: true # Why?

end
