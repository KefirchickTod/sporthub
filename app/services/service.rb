class Service


  # @return[Service::Response]
  def run
    result = run
    success(result)
  rescue => e
    error(error: e.to_s)
  end

  protected

  # Get special class for manipulate response after services
  # @return[Service::Response]
  def success(data = nil)
    Service::Response.new(true, data: data)
  end

  # Get error response
  # @return[Service::Response]
  def error(data = nil, error: nil)
    Service::Response.new(false, data: data, error: error)
  end

end
