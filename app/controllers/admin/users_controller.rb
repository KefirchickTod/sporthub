module Admin
  class UsersController < Admin::AdminController
    # GET admin/users
    def index
      @users = User.all
    end

    # GET /admin/user/[:id]
    def show
    end

    # GET /admin/user/[:id]/edit
    def edit
    end

    # POST /admin/user
    def destroy
    end

    # POST /admin/user
    def update
    end
  end
end
