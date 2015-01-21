# @author Jaime Rump
# This error is thrown when an invalid dimension is specified
class InvalidSizeError < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end
end