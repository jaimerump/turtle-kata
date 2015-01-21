##
# @author Jaime Rump
# This class represents a turtle. A turtle is an object that moves around a grid,
# with its movements described as an angle and a scalar.
#

require 'InvalidAngleError'
require 'OffTheCanvasError'
require 'Coordinate'

class Turtle

	# Attributes

	# @!attribute [r] angle
	# 	The direction in which the turtle is facing, as an angle in degrees.
	# 	0 degrees represents the x axis. The turtle starts facing straight up,
	# 	so 90 degrees. For the purposes of this project, the angle must be a
	# 	multiple of 45 degrees. The angle must be between 0 and 360 degrees.
	@angle = 90

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
	@horizontal_step = 0

	# @!attribute [rw] vertical_step
	# 	An integer representing how far, on each step, the turtle will move,
	# 	vertically based on its current angle
	@vertical_step = 1

	# Functions

	# Initializes the turtle and puts it at the center of the given canvas
	# @param [Canvas] canvas The canvas to put the turtle on
	# @return [Turtle]
	def init(canvas)
	end

	# Turns the turtle counter-clockwise by $change degrees.
	# If the angle passes 360, it loops back around 0.
	# @param [Integer] change The amount to change the angle by
	# @raise [InvalidAngleError] if the angle isn't a multiple of 45
	def turn_left(change)
	end

	# Turns the turtle clockwise by $change degrees.
	# If the angle passes 0, it loops back around 3600.
	# @param [Integer] change The amount to change the angle by
	# @raise [InvalidAngleError] if the angle isn't a multiple of 45
	def turn_right(change)
	end

	# Updates the horizontal_step attribute when needed
	# @return [Integer]
	def recalculate_horizontal_step
	end

	# Updates the vertical_step attribute when needed
	# @return [Integer]
	def recalculate_vertical_step
	end

	# Moves the turtle forward (from its perspective) by $change spaces.
	# If it is facing diagonally, it moves both horizontally and vertically
	# by one space.
	# @param [Integer] spaces The number of spaces to move
	# @raise [OffTheCanvasError] if the turtle walks off the canvas
	def move_forward(spaces)
	end

	# Moves the turtle backward (from its perspective) by $change spaces.
	# If it is facing diagonally, it moves both horizontally and vertically
	# by one space.
	# @param [Integer] spaces The number of spaces to move
	# @raise [OffTheCanvasError] if the turtle backs off the canvas
	def move_backward(spaces)
	end

	

end