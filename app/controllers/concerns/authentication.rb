module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :user_signed_in?
  end

  # Reset all session
  def logout
    reset_session
  end

  # Check if user signed if true then redirect to home "/"
  def redirect_if_authenticated
    redirect_to "/", alert: "You are already logged in." if user_signed_in?
  end

  private

  # Get current session user
  # !Also user as helper method!
  # @return[User]
  def current_user
    Current.user ||= session[:user] && User.find_by(id: session[:user])
  end

  # Check if user sigend
  def user_signed_in?
    Current.user.present?
  end
end
