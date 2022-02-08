class Authentication::RegistrationsController < Authentication::AuthenticationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  # Create user form
  # GET /user/new
  def new
    @user = User.new
  end

  # Create new user by service
  # POST /user
  def create
    register = Users::Authentication::Register.new(register_params, session)

    # @type[ServiceResponse]
    status = register.run

    # puts status, status.error?, status.success?

    if status.error?
      flash[:notice] = status.error_massage
      redirect_to new_authentication_register_url
    else
      redirect_to "/", notice: "Please check your email for confirmation instructions"
    end
  end

  private

  def register_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :second_name)
  end

end
