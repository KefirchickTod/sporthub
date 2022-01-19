class Users::Authentication::Login < Service
  class InvalidPassword < StandardError
  end

  def initialize(params, session)
    @params = validates(params)
    @confirmation_service = Users::Authentication::Confirmation.new(params)

    @session = session
  end

  # Standard method
  # @return[User]
  def call
    @user = find(@params[:email], @params[:password])

    if defined?(@session)
      @session[:user] = @user.id
    end

    @user
  end

  private

  # Was user get confirmation email?
  # If false, show notice error
  def confirmation
    return if @user.confirmed?
    flash[:notice] = "Your email is not confirmed"
  end

  # Find user by email
  # @return[User]
  def find(email, password)
    user = User.find_by(email: email)

    raise "Incorrect email" unless user.present?
    raise InvalidPassword.new("Invalid password") unless user.authenticate(password)

    user
  end

  # Get validated params
  # @return[ActionController]
  def validates(p)
    p.require(:user).permit(:email, :password)
  end
end
