# Delete all prev note
Comment.delete_all

raise 'Cant create seed for comment if empty users' if User.all.empty?
raise 'Cant create seed for comment if empty articles' if Article.all.empty?

users    = User.all
articles = Article.all

100.times do |i|

  comment = Comment.new(
    text: Faker::Book.title,
    article_id: articles.sample.id,
    user_id: users.sample.id
  )

  if i > 10 && rand(0..1) === 1
    comment.parent_id = rand(1..i)
  end

  comment.save

end