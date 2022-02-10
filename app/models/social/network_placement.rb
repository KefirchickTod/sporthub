module Social
  class NetworkPlacement < ApplicationRecord
    has_many :social_networks, class_name: "Social::Network"
  end
end
