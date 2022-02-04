module Admin
  class ArticlesController < Admin::AdminController
    # include ServiceHandle

    # GET /admin/article
    def index
      @pagy, @articles = pagy(Article.all)
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
      @article = Article.find(params[:id])
    end

    # POST /admin/article
    def update
      @article = Articles::Update.new(article_params).call
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
        :title,
        :full_text,
        :short_text,
        :categories_id,
        :is_public,
        :images
      )
    end

  end
end
