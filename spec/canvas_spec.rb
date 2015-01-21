require 'Turtle'
require 'Canvas'

describe Canvas do

	describe ".initialize" do

		it "raises ArgumentError on non-integer arguments" do 
			expect{ c = Canvas.new(11.02) }.to raise_error(ArgumentError, "11.02 is not an Integer")
		end

		it "raises ArgumentError on negative arguments" do 
			expect{ c = Canvas.new(-11) }.to raise_error(ArgumentError, "length must be greater than 0")
		end

		it "raises ArgumentError on 0" do 
			expect{ c = Canvas.new(0) }.to raise_error(ArgumentError, "length must be greater than 0")
		end

		it "raises ArgumentError on even arguments" do 
			expect{ c = Canvas.new(12) }.to raise_error(ArgumentError, "length must be an odd number")
		end

		it "accepts positive odd integers" do 
			expect{ c = Canvas.new(11) }.not_to raise_error
		end

		it "defines the grid" do 
			c = Canvas.new(3)
			grid = [ ['.','.','.'], ['.','.','.'], ['.','.','.'] ]

			expect(c.grid).to eq(grid)
		end

	end

	describe "#center" do 

		it "returns the coordinate at the center of the canvas" do 
			canvas = Canvas.new(5)
			coord = Coordinate.new(3, 3)

			expect(canvas.center).to eq(coord)
		end

	end
	
end