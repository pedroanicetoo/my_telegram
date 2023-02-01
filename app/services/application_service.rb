class ApplicationService

  def self.call(*args)
    service = new(*args)
    service.before
    result = service.call
    service.after
    result
  end

  def before
    method_should_be_implemented!
  end

  def call
    method_should_be_implemented!
  end

  def after
    method_should_be_implemented!
  end

  private

  def method_should_be_implemented!
    raise ExceptionService::MethodShouldBeImplementedException, "method_should_be_implemented"
  end

end
