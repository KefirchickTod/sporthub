class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|

      t.string :title, index: true, unique: true
      t.string :description
      t.string :location

      t.references :categories, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end

    # Create connection table for user its some like subscribe on news
    create_table :user_teams do |t|

      t.references :teams, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true

    end
  end
end
