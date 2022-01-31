module Resources
  module HandleServiceException
    # List of allowed action in route fn name
    ALLOW_ACTION = %i[new edit]

    extend ActiveSupport::Concern
    include Resources::Resource

    included do
      before_action :parse_current_controller

      rescue_from ServiceException, with: :standard_error

      # Try of current action name
      def parse_current_controller
        raise "Not defined ActionController::Params" unless defined?(params)
        initialize_controller(params[:action], params[:controller].split("/").join("_"))
      end

      def standard_error(exception)
        notice(exception.to_s)

        redirect_to get_redirect_url!(@action)
        #  respond_to do |format|
        #  format.html { render @action, status: :unprocessable_entity }
        # format.json { render json: ["error"], status: :unprocessable_entity }
        # end
      end
    end
  end
end
