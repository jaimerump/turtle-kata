##
# @author Jaime Rump
# This class represents a canvas for a turtle to move across.
# It's basically just a 2D array of strings.
#
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

end