module Admin
  class AdminController < ApplicationController
    include Pagy::Backend
    include Resources::HandleServiceException
    include Resources::AutoRedirect
    # layout 'admin'

    # Action
    before_action :redirect_if_not_authenticated
    before_action :redirect_if_not_admin

    private

    def redirect_if_not_admin
      redirect_to root_path unless current_user.has_role?(:admin)
    end
  end
end
