class UserTeamsController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    Users::Teams::Create.new(current_user, user_teams_params).call
    redirect_to users_path
  end

  def destroy
    Users::Teams::Delete.new(current_user, params[:id]).call
    redirect_to users_path
  end

  private

  def user_teams_params
    p = params.require(:user)[:teams]
    raise "Teams must be array" unless p.is_a?(Array)
    p
      .select { |val| !val.to_s.empty? }
      .map { |val| val.to_i }
  end
end
