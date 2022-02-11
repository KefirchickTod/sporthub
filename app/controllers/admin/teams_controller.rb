module Admin
  class TeamsController < Admin::AdminController
    # include ServiceHandle

    # GET /admin/article
    def index
      @pagy, @teams = pagy(Team.all)
    end

    # GET /admin/article/:id
    def show
      # parse_current_controller

      # render plain: "#{get_redirect_url!(get_redirect_action(:update))} #{get_routes} #{@route_fn} #{@controller} #{params[:controller]} <br> #{params[:action]}"
    end

    # GET /admin/article/new
    def new
      @team = Team.new
      @categories = Category.all
    end

    # POST /admin/article
    def create
      # raise params.to_s
      @team = Teams::Create.new(team_params).call
      redirect_to admin_teams_url
    end

    # GET /admin/article/edit
    def edit
      @team = Team.find(params[:id])
    end

    # POST /admin/article
    def update
      @article = Teams::Update.new(params[:id], team_params).call
      redirect_to admin_teams_url
    end

    # POST /admin/article
    def destroy
      Teams::Delete.new(params[:id]).call
      redirect_to admin_teams_url
    end

    private

    def team_params
      params.require(:team).permit(
        :image,
        :title,
        :sub_category_id,
        :categories_id,
        :countries_id
      )
    end
  end
end
