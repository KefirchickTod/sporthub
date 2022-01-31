module Admin
  class AdminController < ApplicationController
    include ServiceHandle
    # layout 'admin'

    # Action
    before_action :redirect_if_not_authenticated
  end
end
