##
# @author Jaime Rump
# This class runs the turtle kata on a logo file.
#

require_relative 'turtle'

class TurtleKata

	# Runs the turtle kata with the given instruction file
	# @param [String] filename The name of the file to use
	def self.run_with_file(filename)
	end

	# Parses an instruction and runs it
	# @param [String] instruction The instruction to run
	# @param [Turtle] turtle The turtle to run the instruction on
	# @raise [ArgumentError] if command isn't recognized or turtle is bad
	def self.run_instruction(instruction, turtle)
		raise ArgumentError.new("Instruction must be a string") if !instruction.is_a? String
		raise ArgumentError.new("You must pass in a Turtle") if !turtle.is_a? Turtle

		parts = instruction.split(' ', 2)
		command = parts.first
		arguments = parts.last

		case command
		when "FD"
			turtle.move_forward(arguments.to_i)
		when "BK"
			turtle.move_backward(arguments.to_i)
		when "RT"
			turtle.turn_right(arguments.to_i)
		when "LT"
			turtle.turn_left(arguments.to_i)
		else
			raise ArgumentError.new("Invalid instruction #{command}")
		end
	end

end