# Before seed delete all notes
ArticleCategory.delete_all

# Create a 10 categories
10.times do |i|

  category = ArticleCategory.new(title: Faker::Hipster.sentence.slice(0, 5))

  if i > 3
    category.parent_id = rand(1..3)
  end

  category.save

end