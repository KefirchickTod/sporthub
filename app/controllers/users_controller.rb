class UsersController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

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

    puts status, status.error?, status.success?

    if status.error?
      flash[:notice] = status.error_massage
      redirect_to new_user_url
    else
      redirect_to "/", notice: "Please check your email for confirmation instructions"
    end
  end
end
