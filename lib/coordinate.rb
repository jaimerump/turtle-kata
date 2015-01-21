##
# @author Jaime Rump
# This class represents a coordinate on a grid. It's basically just
# a container for two ints.
class Coordinate

	attr_accessor :x
	attr_accessor :y

	# The x position of this coordinate
	@x = 0

	# The y position of this coordinate
	@y = 0

	# Creates a new coordinate given its x and y positions
	# @param [Integer] x The x position
	# @param [Integer] y The y position
	# @raise [ArgumentError] if one of the arguments isn't an integer
	def initialize(x, y)
		raise ArgumentError.new("#{x} is not an Integer") if !x.is_a? Integer
		raise ArgumentError.new("#{y} is not an Integer") if !y.is_a? Integer

		@x = x
		@y = y
	end

	# Comparison object
	#
	def ==(object)
		return self.class.name == object.class.name && @x == object.x && @y == object.y
	end

end