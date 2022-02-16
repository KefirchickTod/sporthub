class HomeController < ApplicationController
  # Show main(page) application content
  # GET /
  def index
    @articles = Article.all
    @article = @articles.first
    @categories = Category.all_main
    @survey = Survey.published.sample
  end
end
