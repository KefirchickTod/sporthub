# Clean all notes
# !Warning, notes celled bu id no!

Article.delete_all

# Check if exist category
raise "Cant create article with out created category" if Category.all.empty?

categories = Category.all

DEFAULT_PHOTO = 'https://www.nopcommerce.com/images/thumbs/0005720_coming-soon-page_550.jpeg'

50.times do
  Article.create(
    title: Faker::Book.title,

    short_text: Faker::Lorem.paragraph_by_chars(number: 64, supplemental: false),
    full_text: Faker::Lorem.paragraph_by_chars(number: 255, supplemental: false),
    is_public: rand(0..1),
    default_photo: DEFAULT_PHOTO,
    users_id: 1,
    categories_id: categories.sample.id
  )
end
