# Clean all social network
Social::Network.delete_all

3.times do
  Social::Network.create(
    title: Faker::Internet.domain_name,
    api: Base64.decode64("U2VuZCByZWluZm9yY2V"),
    social_network_placements_id: 1
  )
end
