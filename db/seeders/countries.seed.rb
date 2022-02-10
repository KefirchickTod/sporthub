# Before seed clean all teams
Country.delete_all
# ActiveRecord::Base.connection.execute("TRUNCATE teams RESTART IDENTITY")

25.times do

  Country.create(title: Faker::Address.unique.country)

end
