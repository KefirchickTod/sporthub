class CreateSurveyAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_answers do |t|
      t.references :users
      t.references :survey_options, index: true, foreign_keys: true
      # t.references :surveys, index: true, foreign_keys: true
      t.timestamps
    end
  end
end
