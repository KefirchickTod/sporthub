module Users::Authentication::Password
  class TokenExpiredException < StandardError
  end

  class ConfirmationError < StandardError
  end

  # Using in PasswordController#create for POST
  class CreatorPasswordResetSender < Service
    def initialize(params)
      @params = validates(params)
    end

    def call
      find_user

      raise ConfirmationError.new("Please confirm your email first.") unless @user.confirmed?

      @user.send_password_reset_email!
    end

    private

    # Find user by email or raise Invalid error
    def find_user
      @user = User.find_by(email: @params[:email])
      raise Users::Authentication::Exception::InvalidEmailError.new("If that user exists we've sent instructions to their email.") unless @user.present?
    end

    # Validate params
    # @param[ActionController]
    def validates(p)
      p.require[:user].permit(:email)
    end
  end

  # Using in PasswordController#edit
  class EditorPasswordResetEmail
    def initialize(password_reset_token)
      @token = password_reset_token
    end

    # Find user for
    def call
      find_by_token

      raise "You must confirm your email before you can sign in." if @user.present? && @user.unconfirmed?
    end
  end

  # Using in PasswordController#update for POST
  class UpdatePasswordResetEmail < Service
    def initialize(token, password_params)
      @token = token
      @password_params = password_params
    end

    def call
      user = find_by_token(@token)

      raise ConfirmationError.new("You must confirm your email") unless user.unconfirmed?
      raise user.errors.full_messages unless user.update(@password_params)
    end
  end

  protected

  attr_accessor :user

  # Find user by
  # Use from PasswordController for methods edit|update
  # @param[String]
  # @return[User]
  def find_by_token(token)
    @user = User.find_single(token: @token, purpose: :reset_password)
    raise TokenExpiredException.new("Invalid or expired token.") unless @user
    # raise @user.errors.full_messages.to_sentence unless @user.unconfirmed?
  end
end
