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

end