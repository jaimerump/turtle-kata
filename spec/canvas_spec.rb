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

	describe "#mark_as_traversed" do 

		context "coordinate is outside canvas" do

			it "throws RangeError" do 
				c = Canvas.new(5)

				expect{ c.mark_as_traversed( Coordinate.new(5,5) ) }.to raise_error(RangeError, "coordinate (5,5) is outside of the canvas")
			end

		end

		context "coordinate is inside canvas" do 

			it "replaces the value with the traversed string" do 
				canvas = Canvas.new(5)
				coord = Coordinate.new(3,4)
				canvas.mark_as_traversed(coord)

				expect( canvas.grid[3][4] ).to eq(Canvas::TRAVERSED_CELL_STRING)
			end

		end

	end
	
end