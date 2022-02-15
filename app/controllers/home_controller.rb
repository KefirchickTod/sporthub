class HomeController < ApplicationController
  # Show main(page) application content
  # GET /
  def index
    @articles = Article.all
    @article = @articles.first.is_a?(Article) ? @article.first : Article.new
    @categories = Category.all_main
    @survey = Survey.published.sample
  end
end
