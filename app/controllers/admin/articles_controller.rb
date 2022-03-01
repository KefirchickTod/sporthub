module Admin
  class ArticlesController < Admin::AdminController
    before_action :find_article, only: %i[show edit update delete]
    # include ServiceHandle

    # GET /admin/article
    def index
      @pagy, @articles = pagy(ArticlePolicy::Scope.new(current_user, Article).resolve)
    end

    # GET /admin/article/:id
    def show
      # parse_current_controller

      # render plain: "#{get_redirect_url!(get_redirect_action(:update))} #{get_routes} #{@route_fn} #{@controller} #{params[:controller]} <br> #{params[:action]}"
    end

    # GET /admin/article/new
    def new
      @article = Article.new
      @categories = Category.all
    end

    # POST /admin/article
    def create
      # raise params.to_s
      @article = Articles::Create.new(article_params, session[:user], params[:article][:image]).call
      # redirect_to admin_article_url
    end

    # GET /admin/article/edit
    def edit
    end

    # POST /admin/article
    def update
      authorize @article, :editable?, policy_class: ArticlePolicy

      @article = Articles::Update.new(article_params, params[:id]).call
      redirect_to admin_article_url
    end

    # POST /admin/article
    def destroy
      Articles::Delete.new(params[:id]).call
      redirect_to admin_article_url
    end

    private

    def article_params
      params.require(:article).permit(
        :image,
        :categories_id,
        :teams_id,
        :countries_id,
        :title,
        :caption,
        :content,
        :is_public,
        :show_comment
      )
    end

    # Find article by outer id
    # @return[Article]
    def find_article
      @article = Article.find(params[:id])
    end
  end
end
