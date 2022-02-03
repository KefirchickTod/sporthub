module XhrRender
  extend ActiveSupport::Concern

  included do
    before_action :change_layout
  end

  private

  # If user xhr action then delete current layout
  def change_layout
    self.class.layout false if request.xhr?
  end

end
