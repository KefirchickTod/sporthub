class Admin::ArticlesController < ApplicationController
  # GET /admin/article
  def index
    @articles = Article.all
  end

  # GET /admin/article/:id
  def show
  end

  # GET /admin/article/new
  def new
    @article = Article.new
    @categories = Category.all
  end

  # POST /admin/article
  def create
    # raise params.to_s
    @article = Articles::ArticleCreate.new(params, session[:user]).call
    redirect_to admin_article_url
  rescue => e
    redirect_to new_admin_article_url, alert: e.to_s
  end

  # GET /admin/article/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /admin/article
  def update
    @article = Articles::ArticleUpdate.new(params).call
    redirect_to admin_article_url
  rescue => e
    redirect_to edit_admin_article_url(params[:id]), alert: e.to_s
  end

  # POST /admin/article
  def destroy
    Articles::ArticleDelete.new(params[:id]).call
  rescue => e
    redirect_to edit_admin_article_url(params[:id]), alert: e.to_s
  end
end
