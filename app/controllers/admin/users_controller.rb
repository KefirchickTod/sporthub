module Admin
  class UsersController < Admin::AdminController
    # GET admin/users
    def index
      @pagy, @users = pagy(User.all)
    end

    # GET /admin/user/[:id]
    def show
    end

    # GET /admin/user/[:id]/edit
    def edit
      @user = User.find_by(id: params[:id])
    end

    # POST /admin/user
    def destroy
      Users::Delete.new(params[:id]).call
    end

    # POST /admin/user
    def update
      Users::Update.new(params[:id], user_params).call
    end

    private

    def user_params
      params.require(:user).permit(:email, :first_name, :second_name)
    end

  end
end
