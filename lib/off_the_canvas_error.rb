# @author Jaime Rump
# This error is thrown when an invalid coordinate is given
class OffTheCanvasError < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end
end