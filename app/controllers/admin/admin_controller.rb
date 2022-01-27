module Admin
  class AdminController < ApplicationController
    # layout 'admin'

    # Action
    before_action :redirect_if_not_authenticated
  end
end
