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

		it "sets the horizontal_step" do 
			expect(turtle.horizontal_step).to eq(0)
		end

		it "sets the vertical_step" do 
			expect(turtle.vertical_step).to eq(-1)
		end

	end

	describe "#turn_left" do 
	end

	describe "#turn_right" do 
	end

	describe "#recalculate_horizontal_step" do

		context "when the turtle is completely vertical" do 

			it "returns 0 when straight up" do 
				turtle.angle = 90
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(0)
			end

			it "returns 0 when straight down" do 
				turtle.angle = 270
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(0)
			end

		end

		context "when the turtle is facing left" do 

			it "returns -1 when angled left" do 
				turtle.angle = 135
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(-1)
			end

			it "returns -1 when straight left" do 
				turtle.angle = 180
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(-1)
			end

		end

		context "when the turtle is facing right" do 

			it "returns 1 when angled right" do 
				turtle.angle = 45
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(1)
			end

			it "returns 1 when straight right" do 
				turtle.angle = 0
				turtle.recalculate_horizontal_step
				expect(turtle.horizontal_step).to eq(1)
			end

		end

	end

	describe "#recalculate_vertical_step" do 

		context "when the turtle is completely horizontal" do 

			it "returns 0 when straight right" do
				turtle.angle = 0
				turtle.recalculate_vertical_step
				expect(turtle.vertical_step).to eq(0) 
			end

			it "returns when straight left" do
				turtle.angle = 180
				turtle.recalculate_vertical_step
				expect(turtle.vertical_step).to eq(0) 
			end

		end

		context "when the turtle is facing up" do

			it "returns -1 when straight up" do
				turtle.angle = 90
				turtle.recalculate_vertical_step
				expect(turtle.vertical_step).to eq(-1) 
			end

			it "returns -1 when angled up" do
				turtle.angle = 45
				turtle.recalculate_vertical_step
				expect(turtle.vertical_step).to eq(-1) 
			end

		end

		context "when the turtle is facing down" do 

			it "returns 1 when straight down" do
				turtle.angle = 270
				turtle.recalculate_vertical_step
				expect(turtle.vertical_step).to eq(1) 
			end

			it "returns 1 when angled down" do
				turtle.angle = 225
				turtle.recalculate_vertical_step
				expect(turtle.vertical_step).to eq(1) 
			end

		end

	end
	
end