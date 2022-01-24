class Users::Authentication::Confirmation < Service
  def initialize(email, session = nil)
    # @login = Users::Authentication::Login.new(params, session)
    @email = email
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
    @user = User.find_by(email: @email)
  end

  # Send mail to user email with confirm token
  def send_confirmation
    return unless @user.unconfirmed?

    @user.send_confirmation_email!
  end
end
