require 'Coordinate'

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

end