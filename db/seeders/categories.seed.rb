# Before seed delete all notes
#Category.delete_all
#ActiveRecord::Base.connection.execute("TRUNCATE categories RESTART IDENTITY")

# Create a 10 categories
10.times do |i|

  category = Category.new(title: Faker::Hipster.sentence.slice(0, 5))

  if i > 3
    category.parent_id = rand(1..3)
  end

  category.save

end