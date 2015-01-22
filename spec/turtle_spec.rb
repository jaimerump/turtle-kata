require 'Turtle'
require 'Canvas'

describe Turtle do

	describe ".initialize" do 

		it "raises an error if param isn't a canvas" do 
			expect{ t = Turtle.new("canvas") }.to raise_error(ArgumentError, "Argument is not a Canvas")
		end

		it "puts the turtle in the middle of the canvas" do 
			c = Canvas.new(5)
			t = Turtle.new(c)

			expect(t.position).to eq(c.center)
		end

		it "starts the turtle facing up" do 
			c = Canvas.new(5)
			t = Turtle.new(c)

			expect(t.angle).to eq(90)
		end

	end
	
end