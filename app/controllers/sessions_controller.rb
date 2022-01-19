class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]

  # Validates data from log in form
  def create
    login = Users::Authentication::Login.new(params, session)

    @user = login.call
  rescue Users::Authentication::Login::InvalidPassword => e
    session[:notice] = e.to_s
  ensure
    redirect_to "/"
  end

  # Log out user
  def destroy
    logout
    redirect_to "/", notice: "Signed out"
  end

  # Show page for log in
  def new
    @user = User.new
  end
end
