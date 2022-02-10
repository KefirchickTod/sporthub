class CreateSurveyOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_options do |t|

      t.string :answer, :null => false

      t.references :surveys, index: true, foreign_key: true

      t.timestamps
    end
  end
end
