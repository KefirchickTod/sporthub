# Clean all notes
# !Warning, notes celled bu id no!

# Article.delete_all
# ActiveRecord::Base.connection.execute("TRUNCATE articles RESTART IDENTITY")

# Check if exist category
raise "Cant create articles with out created category" if Category.all.empty?
raise "Cant create articles without users" if User.all.empty?

categories = Category.all
users = User.all
teams = Team.all
country = Country.all

50.times do
  article = Article.create(
    title: "#{Faker::Book.title}#{rand(0..2523234)}",

    caption: Faker::Lorem.paragraph_by_chars(number: 64, supplemental: false),
    content: Faker::Lorem.paragraph_by_chars(number: 255, supplemental: false),
    is_public: rand(0..1),
    show_comment: true,
    teams_id: teams.sample.id,
    countries_id: country.sample.id,
    users_id: users.sample.id,
    categories_id: categories.sample.id
  )

  raise article.errors.to_s unless article.present?
end
