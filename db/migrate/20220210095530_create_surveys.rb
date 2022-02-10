class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|

      t.string :question, index: true, comment: 'Main question'

      t.datetime :active_from, comment: 'Date of start show survey'
      t.datetime :active_to, comment: 'Date of end show surveys and change status to archived'

      t.integer :status, limit: 2, default: 0, comment: "Check if current survey is open or other sattus"

      t.timestamps
    end
  end
end
