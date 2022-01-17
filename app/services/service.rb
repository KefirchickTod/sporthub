class Service

  # Basic method for run
  # @return[ServiceResponse]
  def run
    result = call
    success(result)
  rescue => e
    error(error: e)
  end

  # Interface methods
  def call
    raise "This method is not implemented"
  end

  protected

  # Get special class for manipulate response after services
  # @return[ServiceResponse]
  def success(data = nil)
    ServiceResponse.new(true, data: data)
  end

  # Get error response
  # @return[ServiceResponse]
  def error(data = nil, error: nil)
    ServiceResponse.new(false, data: data, error: error)
  end

end
