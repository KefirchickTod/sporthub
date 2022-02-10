class CreateSocialNetworkPlacements < ActiveRecord::Migration[7.0]
  def change
    create_table :social_network_placements do |t|
      t.string :title, comment: "Placement for social groups"

      t.timestamps
    end
  end
end
