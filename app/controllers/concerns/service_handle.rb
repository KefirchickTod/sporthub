module ServiceHandle
  class RouteFindException < StandardError
  end

  extend ActiveSupport::Concern

  attr_reader :controller, :action, :route_fn, :routes

  RESOURCE_ACTION = {
    update: :edit,
    create: :new,
    destroy: :index
  }
  # List of allowed action in route fn name
  ALLOW_ACTION = %i[new edit]

  included do
    before_action :parse_current_controller
    rescue_from ServiceException, with: :standard_error

    # Try of current action name
    def parse_current_controller
      raise "Not defined ActionController::Params" unless defined?(params)

      initialize_controller(self.class.name, params[:action], params[:controller].split("/").join("_"))
    end
  end

  def standard_error(exception)
    flash_notice(exception.to_s)

    redirect_to get_redirect_url!(@action)
    #  respond_to do |format|
    #  format.html { render @action, status: :unprocessable_entity }
    # format.json { render json: ["error"], status: :unprocessable_entity }
    # end
  end

  protected

  # Register vars after get current controller or action
  def initialize_controller(controller, action, route_root_fn_name)
    @controller = controller
    @action = get_redirect_action(action)
    @route_fn = route_root_fn_name.singularize # if route_root_fn_name.pluralize == route_root_fn_name
    @routes = get_routes
  end

  private

  # Get all routes for current controller
  def get_routes
    name = @route_fn[0...-1] if @route_fn.last == "s"
    Rails.application.routes.named_routes.helper_names.grep(Regexp.new("#{name}([s])?"))
  end

  # Create flash notice
  # @param[String]
  def flash_notice(notice)
    flash[:notice] = notice
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

  # Get correct method for redirect
  #
  #   get_redirect_action(:update) # :edit
  #   get_redirect_action(:create) # :new
  #   get_redirect_action(:new) # :new
  # @param[Symbol]
  # @return[Symbol]
  def get_redirect_action(current)
    current = current.to_sym
    return current unless RESOURCE_ACTION.has_key?(current)
    RESOURCE_ACTION[current]
  end
end
