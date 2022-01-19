class Users::Authentication::Register < Service
  class BadRegisterParam < ArgumentError
  end

  def initialize(params)
    @params = validates(params)
    @confirmation = Users::Authentication::Confirmation.new(params)
  end

  def call
    @user = create_user

    if defined?(session)
      session[:user] = @user.id
    end

    send_confirmation

    @user
  end

  private

  # Send confirmation to email
  def send_confirmation
    @confirmation.call
  end

  # Create new users
  # @return[User]
  # @raise [BadRegisterParam]
  def create_user
    user = user!

    unless user.save
      massage = user.errors.messages

      raise BadRegisterParam.new("Cant create user, errors: #{massage}")

    end
    user
  end

  def user!
    raise "Email already exists" if User.find_by(email: @params[:email]).present?

    User.new(@params)
  end

  # Validate input params from request
  def validates(p)
    p.require(:user).permit(:email, :password, :password_confirmation, :first_name)
  end
end
