class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|

      t.string :title, index: true, unique: true
      t.string :description, null: true
      t.string :location

      t.references :categories, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end

  end
end
