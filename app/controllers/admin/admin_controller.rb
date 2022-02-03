module Admin
  class AdminController < ApplicationController
    include Pagy::Backend
    include Resources::HandleServiceException
    include Resources::AutoRedirect
    # layout 'admin'

    # Action
    before_action :redirect_if_not_authenticated
  end
end
