class Authentication::SessionsController < Authentication::AuthenticationController
  before_action :redirect_if_authenticated, only: %i[create new]

  # Validates data from log in form
  def create
    login = Users::Authentication::Login.new(params, session)

    @user = login.call
  rescue Users::Authentication::Login::InvalidPassword => e
    flash[:notice] = e.to_s
  ensure
    redirect_to "/"
  end

  # Log out user
  def destroy
    logout
    redirect_to "/", info: "Signed out"
  end

  # Show page for log in
  def new
    @user = User.new
  end
end
