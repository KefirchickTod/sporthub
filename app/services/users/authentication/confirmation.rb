class Users::Authentication::Confirmation < Service
  def initialize(params)
    @params = validates(params)
  end

  # Run service
  def call
    @user = find_user

    raise "cant find user by email [#{@params[:email]}]" unless @user.present?

    send_confirmation
  end

  private

  # Find user by email
  # @return[User]
  def find_user
    User.find_by(email: @params[:email])
  end

  # Send mail to user email with confirm token
  def send_confirmation
    return unless @user.unconfirmed?

    @user.send_confirmation_email!
  end

  # Validate outer params
  # @param[ActionController::Parameters]
  # @return[ActionController::Parameters]
  def validates(p)
    p.required(:user).permit(:email)
  end
end
