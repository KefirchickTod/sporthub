class Admin::AdminController < ApplicationController
  # layout 'admin'

  # Action
  before_action :redirect_if_not_authenticated
end
