class ServiceResponse
  attr_accessor :status, :data, :error

  def initialize(status, data: nil, error: nil)
    @status     = status
    @data       = data
    @error_code = error
  end

  # Check if is status ok
  # @return[Boolean]
  def success?
    status
  end

  # Check if exist error
  # @return[Boolean]
  def error?
    !success?
  end

  # Get error massage from service
  # @return[String]
  def error_massage
    # TODO[check]: if error is object convert it to string
    error.to_s
  end

end
