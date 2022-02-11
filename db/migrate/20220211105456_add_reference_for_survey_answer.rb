class AddReferenceForSurveyAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :survey_answers, :survey_options, index: true, foreign_keys: true
  end
end
