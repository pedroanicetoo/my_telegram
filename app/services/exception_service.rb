# frozen_string_literal: true

module ExceptionService
  class MethodShouldBeImplementedException < RuntimeError; end
  class UnavailableServiceException < RuntimeError; end
end
