##
# @author Jaime Rump
# This class represents a canvas for a turtle to move across.
# It's basically just a 2D array of strings.
#

require 'Coordinate'
require 'OffTheCanvasError'

class Canvas

	# Attributes

	# @!attribute [r] grid
	# 	The grid that the canvas represents, it's a 2D array of strings
	@grid = []

	# The string used to represent untouched cells
	UNTRAVERSED_CELL_STRING = '.'
	# The string used to represent cells that have been traversed
	TRAVERSED_CELL_STRING = 'X'
	# The string used to separate columns in the output
	COLUMN_SEPARATOR = ' '
	# The string used to separate rows in the output
	ROW_SEPARATOR = '\n'
	

	# Functions

	# Creates the canvas from the given length
	# @param [Integer] length The length of the sides
	# @return [Canvas]
	# @raise [InvalidSizeError] if the length is not a positive odd number
	def init(length)
	end

	# The coordinate for the center of the grid
	# @return [Coordinate]
	def center
	end

	# Marks the given coordinate as having been traversed
	# @param [Coordinate] coordinate The coordinate to mark
	# @raise [OffTheCanvasError] if the coordinate is outside of the canvas
	def mark_as_traversed(coordinate)

	# Gives a nice pretty string version of the grid
	# @return [String]
	def print
	end

end