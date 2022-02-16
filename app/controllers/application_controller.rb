class ApplicationController < ActionController::Base
  include Authentication
  include LocaleSwitcher
end
