module Social
  class Network < ApplicationRecord
    belongs_to :social_network_placement, class_name: "Social::NetworkPlacement", foreign_key: "social_network_placements_id", primary_key: "id"
  end
end
