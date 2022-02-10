class CreateSocialNetworks < ActiveRecord::Migration[7.0]
  def change
    create_table :social_networks do |t|
      t.string :title, comment: "Name of socail network"
      t.string :api, comment: "For save api from social network"
      t.references :social_network_placements, foreign_key: true, index: true

      t.timestamps
    end
  end
end
