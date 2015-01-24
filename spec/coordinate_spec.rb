require 'coordinate'

describe Coordinate do

	describe '.initialize' do 

		it "raises ArgumentError when x isn't an integer" do 
			expect{ c = Coordinate.new("poop", 2) }.to raise_error(ArgumentError, "poop is not an Integer")
		end

		it "raises ArgumentError when y isn't an integer" do 
			expect{ c = Coordinate.new(2, "poop") }.to raise_error(ArgumentError, "poop is not an Integer")
		end

		it "raises ArgumentError on eecimals" do 
			expect{ c = Coordinate.new(2, 12.0) }.to raise_error(ArgumentError)
		end

		it "works fine when both are integers" do 
			expect{ c = Coordinate.new(2, 2) }.not_to raise_error
		end

		it "sets x to the first argument" do 
			c = Coordinate.new(2, 3)
			expect(c.x).to eq(2)
		end

		it "sets y to the second argument" do 
			c = Coordinate.new(2, 3)
			expect(c.y).to eq(3)
		end

	end

	describe '==' do 

		it "returns false if they're not the same type" do 
			c = Coordinate.new(3, 3)

			expect( c == "3,3" ).to be false
		end

		it "returns true if they are the same object" do 
			c = Coordinate.new(3, 3)

			expect( c == c ).to be true
		end

		it "returns true if the are the same point" do 
			c = Coordinate.new(3, 3)
			c2 = Coordinate.new(3, 3)

			expect( c == c2 ).to be true
		end

	end

	describe "+" do 
	
		context "when you pass in a coordinate" do 

			it "adds the x value to its own" do
				base_coord = Coordinate.new(5,5)
				operand_coord = Coordinate.new(2,3)
				expect( (base_coord+operand_coord).x ).to eq(7)
			end

			it "adds the y value to its own" do
				base_coord = Coordinate.new(5,5)
				operand_coord = Coordinate.new(2,3)
				expect( (base_coord+operand_coord).y ).to eq(8)
			end

		end

		context "when you pass in a non-coordinate" do 

			it "raises an ArgumentError" do 
				c = Coordinate.new(5,5)
				expect{ c+"poop" }.to raise_error(ArgumentError, "Argument must be a Coordinate")
			end

		end

	end

	describe "-" do 

		context "when you pass in a coordinate" do 

			it "subtracts the x value from its own" do
				base_coord = Coordinate.new(5,5)
				operand_coord = Coordinate.new(2,3)
				expect( (base_coord-operand_coord).x ).to eq(3)
			end

			it "subtracts the y value from its own" do
				base_coord = Coordinate.new(5,5)
				operand_coord = Coordinate.new(2,3)
				expect( (base_coord-operand_coord).y ).to eq(2)
			end

		end

		context "when you pass in a non-coordinate" do 

			it "raises an ArgumentError" do 
				c = Coordinate.new(5,5)
				expect{ c-"poop" }.to raise_error(ArgumentError, "Argument must be a Coordinate")
			end

		end

	end

	describe "#to_s" do 

		it "outputs the coordinate" do 
			c = Coordinate.new(3,5)
			expect(c.to_s).to eq("(3,5)")
		end

	end

end