class Team < ApplicationRecord

  has_many :user_teams, foreign_key: "teams_id", primary_key: "id"

end
