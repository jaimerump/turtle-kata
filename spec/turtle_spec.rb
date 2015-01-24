require 'Turtle'
require 'Canvas'

describe Turtle do

	let(:canvas) { Canvas.new(5) }
	let(:turtle) { Turtle.new(canvas) }

	describe ".initialize" do 

		it "raises an error if param isn't a canvas" do 
			expect{ t = Turtle.new("canvas") }.to raise_error(ArgumentError, "Argument is not a Canvas")
		end

		it "puts the turtle in the middle of the canvas" do 
			expect(turtle.position).to eq(canvas.center)
		end

		it "starts the turtle facing up" do 
			expect(turtle.angle).to eq(90)
		end

		it "sets the horizontal step" do 
			expect(turtle.step.x).to eq(0)
		end

		it "sets the vertical step" do 
			expect(turtle.step.y).to eq(-1)
		end

	end

	describe "#turn_left" do 

		it "raises ArgumentError if angle isn't integer" do 
			expect{ turtle.turn_left(45.00) }.to raise_error(ArgumentError, "45.0 is not an Integer")
		end

		it "raises ArgumentError if angle isn't multiple of 45" do 
			expect{ turtle.turn_left(48) }.to raise_error(ArgumentError, "48 is not a multiple of 45")
		end

		it "adds the param to the current angle" do 
			starting_angle = turtle.angle
			turtle.turn_left(180)
			expect(turtle.angle).to eq(starting_angle+180)
		end

		it "rolls back around if it passes 360" do 
			starting_angle = turtle.angle
			turtle.turn_left(405)
			expect(turtle.angle).to eq(starting_angle+45)
		end

		it "recalculates horizontal step" do 
			turtle.turn_left(90)
			questioned_step = turtle.step.x

			# Manually recalculate
			turtle.recalculate_step
			confirmed_step = turtle.step.x

			expect(questioned_step).to eq(confirmed_step)
		end

		it "recalculates vertical step" do 
			turtle.turn_left(90)
			questioned_step = turtle.step.y

			# Manually recalculate
			turtle.recalculate_step
			confirmed_step = turtle.step.y

			expect(questioned_step).to eq(confirmed_step)
		end

	end

	describe "#turn_right" do 

		it "raises ArgumentError if angle isn't integer" do 
			expect{ turtle.turn_right(45.00) }.to raise_error(ArgumentError, "45.0 is not an Integer")
		end

		it "raises ArgumentError if angle isn't multiple of 45" do 
			expect{ turtle.turn_right(48) }.to raise_error(ArgumentError, "48 is not a multiple of 45")
		end

		it "subtracts the param from the current angle" do 
			starting_angle = turtle.angle
			turtle.turn_right(45)
			expect(turtle.angle).to eq(starting_angle-45)
		end

		it "rolls back around if it passes 0" do 
			starting_angle = turtle.angle
			turtle.turn_right(405)
			if starting_angle >= 45
				expect(turtle.angle).to eq(starting_angle-45)
			else
				expect(turtle.angle).to eq(315)
			end

		end

		it "recalculates horizontal step" do 
			turtle.turn_right(90)
			questioned_step = turtle.step.x

			# Manually recalculate
			turtle.recalculate_step
			confirmed_step = turtle.step.x

			expect(questioned_step).to eq(confirmed_step)
		end

		it "recalculates vertical step" do 
			turtle.turn_right(90)
			questioned_step = turtle.step.y

			# Manually recalculate
			turtle.recalculate_step
			confirmed_step = turtle.step.y

			expect(questioned_step).to eq(confirmed_step)
		end

	end

	describe "#recalculate_step" do

		describe "recalculates the horizontal" do

			context "when the turtle is completely vertical" do 

				it "returns 0 when straight up" do 
					turtle.angle = 90
					turtle.recalculate_step
					expect(turtle.step.x).to eq(0)
				end

				it "returns 0 when straight down" do 
					turtle.angle = 270
					turtle.recalculate_step
					expect(turtle.step.x).to eq(0)
				end

			end

			context "when the turtle is facing left" do 

				it "returns -1 when angled left" do 
					turtle.angle = 135
					turtle.recalculate_step
					expect(turtle.step.x).to eq(-1)
				end

				it "returns -1 when straight left" do 
					turtle.angle = 180
					turtle.recalculate_step
					expect(turtle.step.x).to eq(-1)
				end

			end

			context "when the turtle is facing right" do 

				it "returns 1 when angled right" do 
					turtle.angle = 45
					turtle.recalculate_step
					expect(turtle.step.x).to eq(1)
				end

				it "returns 1 when straight right" do 
					turtle.angle = 0
					turtle.recalculate_step
					expect(turtle.step.x).to eq(1)
				end

			end

		end

		describe "recalculates the vertical" do

			context "when the turtle is completely horizontal" do 

				it "returns 0 when straight right" do
					turtle.angle = 0
					turtle.recalculate_step
					expect(turtle.step.y).to eq(0) 
				end

				it "returns when straight left" do
					turtle.angle = 180
					turtle.recalculate_step
					expect(turtle.step.y).to eq(0) 
				end

			end

			context "when the turtle is facing up" do

				it "returns -1 when straight up" do
					turtle.angle = 90
					turtle.recalculate_step
					expect(turtle.step.y).to eq(-1) 
				end

				it "returns -1 when angled up" do
					turtle.angle = 45
					turtle.recalculate_step
					expect(turtle.step.y).to eq(-1) 
				end

			end

			context "when the turtle is facing down" do 

				it "returns 1 when straight down" do
					turtle.angle = 270
					turtle.recalculate_step
					expect(turtle.step.y).to eq(1) 
				end

				it "returns 1 when angled down" do
					turtle.angle = 225
					turtle.recalculate_step
					expect(turtle.step.y).to eq(1) 
				end

			end

		end

	end

	describe "#move_forward" do 

		it "throws an ArgumentError if the parameter isn't an Integer" do 
			expect{ turtle.move_forward("poop") }.to raise_error(ArgumentError, "Argument must be an Integer")
		end

		it "adds the turtle's step to its position" do
			starting_positon = turtle.position
			step = turtle.step 
			turtle.move_forward(1)

			expect(turtle.position).to eq(starting_positon+step)
		end

		it "marks the spaces as traversed" do 
			turtle.move_forward(1)
			expect(canvas.character_at(turtle.position)).to eq(Canvas::TRAVERSED_CELL_STRING)
		end

		it "throws a RangeError if the turtle falls off the canvas" do 
			expect{ turtle.move_forward(canvas.grid.length*2) }.to raise_error(RangeError, "Turtle fell off the Canvas")
		end

	end

	describe "#move_backward" do 

		it "throws an ArgumentError if the parameter isn't an Integer" do 
			expect{ turtle.move_backward("poop") }.to raise_error(ArgumentError, "Argument must be an Integer")
		end

		it "subtracts the turtle's step from its position" do
			starting_positon = turtle.position
			step = turtle.step 
			turtle.move_backward(1)

			expect(turtle.position).to eq(starting_positon-step)
		end

		it "marks the spaces as traversed" do 
			turtle.move_backward(1)
			expect(canvas.character_at(turtle.position)).to eq(Canvas::TRAVERSED_CELL_STRING)
		end

		it "throws a RangeError if the turtle falls off the canvas" do 
			expect{ turtle.move_backward(canvas.grid.length*2) }.to raise_error(RangeError, "Turtle fell off the Canvas")
		end

	end
	
end