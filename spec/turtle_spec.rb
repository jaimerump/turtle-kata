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

	end

	describe "#turn_left" do 
	end

	describe "#turn_right" do 
	end

	describe "#recalculate_horizontal_step" do

		context "when the turtle is completely vertical" do 

			it "returns 0 for 90 degrees" do 
				turtle.angle = 90
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(0)
			end

			it "returns 0 for 270 degrees" do 
				turtle.angle = 270
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(0)
			end

		end

		context "when the turtle is facing left" do 

			it "returns -1 for 135 degrees" do 
				turtle.angle = 135
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(-1)
			end

			it "returns -1 for 180 degrees" do 
				turtle.angle = 180
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(-1)
			end

		end

		context "when the turtle is facing right" do 

			it "returns 1 for 45 degrees" do 
				turtle.angle = 45
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(1)
			end

			it "returns 1 for 0 degrees" do 
				turtle.angle = 0
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(1)
			end

		end

	end

	describe "#recalculate_vertical_step" do 
	end
	
end