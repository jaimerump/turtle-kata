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

	end

end