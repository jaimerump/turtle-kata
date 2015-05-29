require 'turtle'
require 'canvas'

describe Canvas do

  let(:canvas) { Canvas.new(5) }

  describe '.initialize' do

    it 'raises ArgumentError on non-integer arguments' do
      expect{ c = Canvas.new(11.02) }.to raise_error(ArgumentError, '11.02 is not an Integer')
    end

    it 'raises ArgumentError on negative arguments' do
      expect{ c = Canvas.new(-11) }.to raise_error(ArgumentError, 'length must be greater than 0')
    end

    it 'raises ArgumentError on 0' do
      expect{ c = Canvas.new(0) }.to raise_error(ArgumentError, 'length must be greater than 0')
    end

    it 'raises ArgumentError on even arguments' do
      expect{ c = Canvas.new(12) }.to raise_error(ArgumentError, 'length must be an odd number')
    end

    it 'accepts positive odd integers' do
      expect{ c = Canvas.new(11) }.not_to raise_error
    end

    it 'defines the grid' do
      c = Canvas.new(3)
      grid = [ ['.','.','.'], ['.','.','.'], ['.','.','.'] ]

      expect(c.grid).to eq(grid)
    end

  end

  describe '#center' do

    it 'returns the coordinate at the center of the canvas' do
      coord = Coordinate.new(2, 2) # Keep in mind off-by-one

      expect(canvas.center).to eq(coord)
    end

  end

  describe '#mark_as_traversed' do

    it 'throws ArgumentError if not given a coordinate' do
      expect{ canvas.mark_as_traversed('poop') }.to raise_error(ArgumentError, 'Argument is not a Coordinate')
    end

    context 'coordinate is outside canvas' do

      it 'throws RangeError' do
        expect{ canvas.mark_as_traversed( Coordinate.new(5, 5) ) }.to raise_error(RangeError, 'coordinate (5, 5) is outside of the canvas')
        expect{ canvas.mark_as_traversed( Coordinate.new(-1, -1) ) }.to raise_error(RangeError, 'coordinate (-1, -1) is outside of the canvas')
      end

    end

    context 'coordinate is inside canvas' do

      it 'replaces the value with the traversed string' do
        coord = Coordinate.new(3,4)
        canvas.mark_as_traversed(coord)

        expect( canvas.grid[4][3] ).to eq(Canvas::TRAVERSED_CELL_STRING)
      end

    end

  end

  describe '#at' do

    it 'throws ArgumentError if not given a coordinate' do
      expect{ canvas.character_at('poop') }.to raise_error(ArgumentError, 'Argument is not a Coordinate')
    end

    context 'coordinate is outside canvas' do

      it 'throws RangeError' do
        expect{ canvas.character_at( Coordinate.new(5, 5) ) }.to raise_error(RangeError, 'coordinate (5, 5) is outside of the canvas')
        expect{ canvas.character_at( Coordinate.new(-1, -1) ) }.to raise_error(RangeError, 'coordinate (-1, -1) is outside of the canvas')
      end

    end

    context 'coordinate is inside canvas' do

      it 'returns the value in that cell' do
        expect( canvas.character_at(Coordinate.new(3, 4)) ).to eq(canvas.grid[4][3])
      end

    end

  end

  describe '#print' do

    it 'prints the grid' do
      canvas = Canvas.new(3)

      for i in 0..2
        canvas.mark_as_traversed(Coordinate.new(1, i))
      end

      master = '. X .\n. X .\n. X .'

      expect(canvas.print).to eq(master)
    end

  end

end
