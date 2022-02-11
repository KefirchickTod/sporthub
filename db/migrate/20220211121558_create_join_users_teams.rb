class CreateJoinUsersTeams < ActiveRecord::Migration[7.0]
  def change
    create_join_table :teams, :users do |t|
      t.index [:user_id, :team_id]
      t.index [:team_id, :user_id]
    end
  end
end
