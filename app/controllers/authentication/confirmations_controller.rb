class Authentication::ConfirmationsController < Authentication::AuthenticationController
  # Find user by email and send confirmation mail
  def create
    Users::Authentication::Confirmation.new(confirmation_email).call
  end

  def edit
    # Login user
  end

  def new
    @user = User.new
  end

  private

  # Get confirmation email
  # @return[String]
  def confirmation_email
    params.require(:user).permit(:email)[:email]
  end

end
