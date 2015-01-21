##
# @author Jaime Rump
# This class represents a canvas for a turtle to move across.
# It's basically just a 2D array of strings.
#

require 'Coordinate'

class Canvas

	# Attributes

	attr_accessor :grid

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
	# @raise [ArgumentError] if the length is not an integer, not positive, or even
	def initialize(length)
		raise ArgumentError.new("#{length} is not an Integer") if !length.is_a? Integer
		raise ArgumentError.new("length must be greater than 0") if length <= 0
		raise ArgumentError.new("length must be an odd number") if length.even?

		@grid = Array.new(length, Array.new(length, UNTRAVERSED_CELL_STRING) )
	end

	# The coordinate for the center of the grid
	# @return [Coordinate]
	def center
		x = ( @grid.length.to_f / 2 ).ceil
		coord = Coordinate.new(x, x)
	end

	# Marks the given coordinate as having been traversed
	# @param [Coordinate] coordinate The coordinate to mark
	# @raise [RangeError] if the coordinate is outside of the canvas
	def mark_as_traversed(coordinate)
	end

	# Gives a nice pretty string version of the grid
	# @return [String]
	def print
	end

end