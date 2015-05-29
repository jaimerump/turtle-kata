require 'turtle_kata'

describe TurtleKata do

  describe '.run_with_file' do
  end

  describe '.run_instruction' do

    let(:turtle) { double(:turtle,
                          is_a?: true,
                          move_forward: 'forward',
                          move_backward: 'backward',
                          turn_right: 'turn_right',
                          turn_left: 'turn_left') }

    context "when the first arg isn't a string" do

      it 'raises ArgumentError' do
        expect{ TurtleKata.run_instruction(12, turtle) }.to raise_error(ArgumentError, 'Instruction must be a string')
      end

    end

    context "when the second arg isn't a turtle" do

      it 'raises ArgumentError' do
        expect{ TurtleKata.run_instruction('FD 5', 'not turtle') }.to raise_error(ArgumentError, 'You must pass in a Turtle')
      end

    end

    context 'when the instruction is FD' do

      it 'moves the turtle forward' do
        TurtleKata.run_instruction('FD 5', turtle)
        expect(turtle).to have_received(:move_forward).with(5)
      end

    end

    context 'when the instruction is BK' do

      it 'moves the turtle backward' do
        TurtleKata.run_instruction('BK 5', turtle)
        expect(turtle).to have_received(:move_backward).with(5)
      end

    end

    context 'when the instruction is RT' do

      it 'turns the turtle right' do
        TurtleKata.run_instruction('RT 90', turtle)
        expect(turtle).to have_received(:turn_right).with(90)
      end

    end

    context 'when the instruction is LT' do

      it 'turns the turtle left' do
        TurtleKata.run_instruction('LT 90', turtle)
        expect(turtle).to have_received(:turn_left).with(90)
      end

    end

    context 'when the instruction is REPEAT' do

      it 'repeats the bracketed code x times' do
        TurtleKata.run_instruction('REPEAT 2 [RT 90]', turtle)
        expect(turtle).to have_received(:turn_right).with(90).twice
      end

      context 'when the bracketed code is invalid' do

        it 'raises ArgumentError' do
          expect{ TurtleKata.run_instruction('REPEAT 2 [JK 5]', turtle) }.to raise_error(ArgumentError, 'Invalid instruction JK')
        end

      end

    end

    context 'when the instuction is something else' do

      it 'raises ArgumentError' do
        expect{ TurtleKata.run_instruction('JK 5', turtle) }.to raise_error(ArgumentError, 'Invalid instruction JK')
      end

    end

    it 'propagates errors from the turtle class' do
      t = Turtle.new( Canvas.new(5) )
      expect{ TurtleKata.run_instruction('FD 100', t) }.to raise_error(RangeError, 'Turtle fell off the Canvas')
    end

  end

end
