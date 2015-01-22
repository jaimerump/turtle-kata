##
# @author Jaime Rump
# This class represents a turtle. A turtle is an object that moves around a grid,
# with its movements described as an angle and a scalar.
#

require 'Coordinate'
require 'Canvas'

class Turtle

	# Attributes
	attr_accessor :angle, :position, :horizontal_step, :vertical_step

	# @!attribute [r] angle
	# 	The direction in which the turtle is facing, as an angle in degrees.
	# 	0 degrees represents the x axis. The turtle starts facing straight up,
	# 	so 90 degrees. For the purposes of this project, the angle must be a
	# 	multiple of 45 degrees. The angle must be between 0 and 360 degrees.
	@angle

	# @!attribute [r] position
	# 	The position the turtle is currently in on the canvas as a Coordinate
	# 	Defaults to the center of the canvas
	@position 

	# @!attribute [r] canvas
	# 	The canvas the turtle is moving across.
	@canvas

	# @!attribute [rw] horizontal_step
	# 	An integer representing how far, on each step, the turtle will move,
	# 	horizontally based on its current angle
	# 	Negative to go left, positive to go right
	@horizontal_step

	# @!attribute [rw] vertical_step
	# 	An integer representing how far, on each step, the turtle will move,
	# 	vertically based on its current angle
	# 	Negative to go up, positive to go down
	@vertical_step


	# Functions

	# Initializes the turtle and puts it at the center of the given canvas
	# @param [Canvas] canvas The canvas to put the turtle on
	# @return [Turtle]
	# @raise [ArgumentError] if the argument is not a Canvas
	def initialize(canvas)
		raise ArgumentError.new("Argument is not a Canvas") if !canvas.is_a? Canvas

		@canvas = canvas
		@position = canvas.center
		@angle = 90
		@horizontal_step = recalculate_horizontal_step
		@vertical_step = recalculate_vertical_step
	end

	# Turns the turtle counter-clockwise by $change degrees.
	# If the angle passes 360, it loops back around 0.
	# @param [Integer] change The amount to change the angle by
	# @raise [ArgumentError] if the angle isn't an integer multiple of 45
	def turn_left(change)
		raise ArgumentError.new("#{change} is not an Integer") if !change.is_a? Integer
		raise ArgumentError.new("#{change} is not a multiple of 45") if change % 45 != 0

		@angle = (@angle + ( change % 360 )) % 360
		
		recalculate_horizontal_step
		recalculate_vertical_step
	end

	# Turns the turtle clockwise by $change degrees.
	# If the angle passes 0, it loops back around 360.
	# @param [Integer] change The amount to change the angle by
	# @raise [ArgumentError] if the angle isn't an integer multiple of 45
	def turn_right(change)
		raise ArgumentError.new("#{change} is not an Integer") if !change.is_a? Integer
		raise ArgumentError.new("#{change} is not a multiple of 45") if change % 45 != 0

		if change > @angle
			turn_left(360 - ( change % 360 ) )
		else
			@angle = @angle - ( change % 360 )
		end

		recalculate_horizontal_step
		recalculate_vertical_step
	end

	# Updates the horizontal_step attribute when needed
	def recalculate_horizontal_step
		if @angle == 90 || @angle == 270
			@horizontal_step = 0
		elsif @angle > 90 && @angle < 270
			@horizontal_step = -1
		else
			@horizontal_step = 1
		end
	end

	# Updates the vertical_step attribute when needed
	def recalculate_vertical_step
		if @angle == 0 || @angle == 180
			@vertical_step = 0
		elsif @angle > 0 && @angle < 180
			@vertical_step = -1
		else
			@vertical_step = 1
		end
	end

	# Moves the turtle forward (from its perspective) by $change spaces.
	# If it is facing diagonally, it moves both horizontally and vertically
	# by one space.
	# @param [Integer] spaces The number of spaces to move
	# @raise [RangeError] if the turtle walks off the canvas
	def move_forward(spaces)
	end

	# Moves the turtle backward (from its perspective) by $change spaces.
	# If it is facing diagonally, it moves both horizontally and vertically
	# by one space.
	# @param [Integer] spaces The number of spaces to move
	# @raise [RangeError] if the turtle backs off the canvas
	def move_backward(spaces)
	end

	

end