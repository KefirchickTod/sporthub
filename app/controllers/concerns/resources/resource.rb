module Resources
  module Resource
    # extend ActiveSupport::Concern

    # List of similar action for auto redirect
    RESOURCE_ACTION = {
      update: :edit,
      create: :new,
      destroy: :index
    }

    # Use only private or protected methods
    # Basic function for rest modules
    protected

    # Get correct method for redirect
    #
    #   get_redirect_action(:update) # :edit
    #   get_redirect_action(:create) # :new
    #   get_redirect_action(:new) # :new
    # @param[Symbol]
    # @return[Symbol]
    def get_redirect_action(action)
      return action unless RESOURCE_ACTION.has_key?(action) # If current action isn post
      RESOURCE_ACTION[action] ||= action
    end

    # Create flash notice
    # @param[String]
    def notice(msg)
      flash[:notice] = msg
    end

    # Init basic data
    def initialize_controller(action, route)
      @action = get_redirect_action(action.to_sym)
      @route = route.singularize
      @routes = get_routes
    end

    # Get all routes for current controller
    #
    # @return[Array]
    def get_routes
      Rails.application.routes.named_routes.helper_names.grep(Regexp.new("#{@route}|#{@route.pluralize}")).to_set.to_a
    end

    # Build helper function without type of link (path or url)
    # @param[Symbol]
    # @param[Boolean]
    # @return[String]
    def build_helper_fn(action, delete_s = true)
      action = get_redirect_action(action) if RESOURCE_ACTION.has_key?(action)

      function_name = delete_s ? @route_fn : @route_fn.pluralize
      if ALLOW_ACTION.include?(action)
        "#{action}_#{function_name}"
      else
        # puts function_name.pluralize
        function_name.pluralize
      end
    end

    # Find helper function by current controller method and get it
    #   get_redirect_path(:new) # return compile function new_#{controller}
    #
    # For @examples: Admin::ArticleController
    #   get_redirect_path(:new)
    #   # return is; new_admin_article_url => 'http:://{site}/admin/article/new(.:format)'
    # @param[Symbol]
    # @return[String]
    def get_redirect_url!(current)
      helper = "#{build_helper_fn(current)}_url"
      puts "\n #{helper} #{@routes.include?(helper)} \n"
      unless @routes.include?(helper)
        helper = build_helper_fn(current, false)
      end

      raise RouteFindException.new("Cant find helper [#{helper}] in routes") unless @routes.include?(helper)
      send(helper, params[:id] || nil)
    end
  end

  def self.included(other)
    other.extend(Resource)
  end
end
