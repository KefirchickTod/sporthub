class UsersController < ApplicationController

  # Create user form
  # GET /user/new
  def new
    @user = User.new
  end

  # Create new user by service
  # POST /user
  def create
    register = Users::Authentication::Register.new(params)

    # @type[ServiceResponse]
    status = register.run

    if status.error?
      flash[:notice] = status.error_massage
      redirect_back new_user_url
    end

    redirect_to '/'

  end
end
