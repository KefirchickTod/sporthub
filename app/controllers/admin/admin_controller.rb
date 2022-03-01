module Admin
  class AdminController < ApplicationController
    include Pagy::Backend
    include Resources::HandleServiceException
    include Resources::AutoRedirect
    include Pundit::Authorization

    layout "admin"

    # Action
    before_action :redirect_if_not_authenticated
    before_action :redirect_if_permission_denied

    private

    def redirect_if_permission_denied
      redirect_to root_path unless current_user.admin? || current_user.moderator?
    end
  end
end
