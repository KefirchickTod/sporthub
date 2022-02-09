# Before seed clean all teams
Team.delete_all
# ActiveRecord::Base.connection.execute("TRUNCATE teams RESTART IDENTITY")

# Loop for create another rand teams (5)

categories = Category.all
author = User.all

5.times do

  Team.create(
    title: Faker::Sports::Football.team,
    description: Faker::Sports::Football.position,
    location: 'UA',
    categories_id: categories.sample.id,
    author_id: author.sample.id
  )

end
