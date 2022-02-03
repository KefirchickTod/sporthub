class UsersController < ApplicationController
  include Resources::HandleServiceException
  include XhrRender
  before_action :redirect_if_not_authenticated

  # GET /user/:id
  def show
    @user = current_user
    render :edit
  end

  # GET /users/:id/edit
  def edit
    @user = current_user
  end

  # POST /users/:id
  def update
    Users::Update.new(current_user.id, user_params).call
  end

  def destroy
    Users::Delete.new(current_user.id).call
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :second_name, :email)
  end

end
