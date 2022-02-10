# Before seed clean all teams
Team.delete_all
# ActiveRecord::Base.connection.execute("TRUNCATE teams RESTART IDENTITY")

# Loop for create another rand teams (5)

categories = Category.all_main
author = User.all

5.times do
  category = categories.sample
  sub = category.all_sub_categories

  Team.create(
    title: Faker::Sports::Football.team,
    countries_id: Country.all.sample.id,
    sub_category_id: sub || 0,
    categories_id: category.id,
    author_id: author.sample.id
  )
end
