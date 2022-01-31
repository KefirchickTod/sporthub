module Resources
  module AutoRedirect
    extend ActiveSupport::Concern
    include Resources

    included do
      after_action :auto_redirect, only: %i[create update desctroy]

      def auto_redirect
        init

        unless redirect?
          redirect_to default_redirect
        end
      end

      def init
        raise "Not defined ActionController::Params" unless defined?(params)
        initialize_controller(params[:action], params[:controller].split("/").join("_"))
      end
    end

    # Get redirect url
    # @return[String]
    def default_redirect
      get_redirect_url!(@action)
    end

    # Check if controller result has redirect
    def redirect?
      performed?
    end
  end
end
