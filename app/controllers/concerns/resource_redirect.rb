module ResourceRedirect
  extend ActiveSupport::Concern

  included do
  end

  private

  # Check if controller result has redirect
  def redirect?
    false
  end
end
