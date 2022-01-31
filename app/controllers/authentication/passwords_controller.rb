class Authentication::PasswordsController < Authentication::AuthenticationController
  def create
    Users::Authentication::Password::CreatorPasswordResetSender.new(params).call
  rescue Users::Authentication::Password::ConfirmationError => e
    redirect_to new_authentication_confirmations_path, alert: e.to_s
  rescue Users::Authentication::Exceptions::InvalidEmailError => e
    redirect_to "/", notice: e.to_s
  end

  def new
  end

  def edit
    Users::Authentication::Password::EditorPasswordResetEmail.new(params).call
  rescue Users::Authentication::Password::TokenExpiredException => e
    redirect_to new_authentication_confirmations_path, alert: e.to_s
  rescue => e
    redirect_to "password", notice: e.to_s
  end

  def update
    Users::Authentication::Password::UpdatePasswordResetEmail.new(params).call
  rescue Users::Authentication::Password::ConfirmationError => e
    redirect_to new_authentication_confirmations_path, alert: e.to_s
  rescue Users::Authentication::Password::TokenExpiredException => e
    redirect_to new_authentication_confirmations_path, alert: e.to_s
  rescue => e
    flash.now[:alert] = @user.errors.full_messages.to_sentence
    render :edit, status: :unprocessable_entity
  end
end
