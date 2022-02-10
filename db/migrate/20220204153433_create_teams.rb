class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|

      t.string :title, index: true, unique: true

      #t.references :sub_category, index: true, foreign_key: { to_table: :categories }
      #t.references :categories, index: true, foreign_key: true
      #t.references :author, index: true, foreign_key: { to_table: :users }
      #t.references :countries, index: true, foreign_key: true
      #t.references :countries, index: true, foreign_key: true

      t.timestamps
    end

  end
end
