##
# @author Jaime Rump
# This class represents a turtle. A turtle is an object that moves around a grid,
# with its movements described as an angle and a scalar.
#
class Turtle

	# Attributes

	# @!attribute [r] angle
	# 	The direction in which the turtle is facing, as an angle in degrees.
	# 	0 degrees represents the x axis. The turtle starts facing straight up,
	# 	so 90 degrees. For the purposes of this project, the angle must be a
	# 	multiple of 45 degrees.
	@angle = 90

	# @!attribute [r] position
	# 	The position the turtle is currently in on the canvas. Represented
	# 	as a hash of two integers {x: 0, y: 0}. 
	# 	Defaults to the center of the canvas
	@position = {x: 0, y: 0}

	# @!attribute [r] canvas
	# 	The canvas the turtle is moving across.
	@canvas

	# Functions
end