module Authentication
  class PasswordsController < Authentication::AuthenticationController

    rescue_from Users::Authentication::Password::TokenExpiredException, with: :standard_error
    rescue_from Users::Authentication::Password::ConfirmationError, with: :standard_error

    def create
      Users::Authentication::Password::CreatorPasswordResetSender.new(create_password_params).call
    rescue Users::Authentication::Exceptions::InvalidEmailError => e
      redirect_to "/", notice: e.to_s
    end

    def new
    end

    def edit
      Users::Authentication::Password::EditorPasswordResetEmail.new(params[:token]).call
    rescue => e
      redirect_to "password", notice: e.to_s
    end

    def update
      Users::Authentication::Password::UpdatePasswordResetEmail.new(params[:token], update_password_params).call
    rescue => e
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end

    private

    # If error redirect to aut confirmation
    def to_authentication_confirmation(exception)
      redirect_to new_authentication_confirmation_path, alert: exception.to_s
    end

    def update_password_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # Get user email from params
    # @return[String]
    def create_password_params
      params.require(:user).permit(:email)[:email]
    end

  end
end

