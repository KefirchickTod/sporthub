class CreateUserTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :user_teams do |t|
      t.references :teams, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true
    end
  end
end
