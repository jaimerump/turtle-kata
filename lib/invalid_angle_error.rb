# @author Jaime Rump
# This error is thrown when an invalid angle is given
class InvalidAngleError < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end
end