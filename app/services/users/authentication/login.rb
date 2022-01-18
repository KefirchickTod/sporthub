class Users::Authentication::Login < Service
  def initialize(params)
    @params = validates(params)
  end

  # Standard method
  def call
    @user = find(@params[:email])

    raise "Cant find user by email" unless @user.present?

    if defined?(session)
      session[:user] = @user.id
    end

    @user
  end

  private

  # Find user by email
  # @return[User]
  def find(email)
    User.find_by(email: email)
  end

  # Get validated params
  # @return[ActionController]
  def validates(p)
    p.require(:user).permit(:email, :password)
  end
end
