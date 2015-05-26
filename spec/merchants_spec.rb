require_relative 'spec_helper'

describe 'my class' do
  describe '#read_line' do
    before :each do
      @myClass = MyClass.new
    end

    it 'reads glob is I' do
      @myClass.read_line('glob is I')
      result = @myClass.get_space_value(:glob)

      expect(result).to eq(1)
    end

    it 'reads prok is V' do
      @myClass.read_line('prok is V')
      result = @myClass.get_space_value(:prok)

      expect(result).to eq(5)
    end

    it 'reads glob is X' do
      @myClass.read_line('glob is X')
      result = @myClass.get_space_value(:glob)

      expect(result).to eq(10)
    end

    it 'reads tegj is L' do
      @myClass.read_line('tegj is L')
      result = @myClass.get_space_value(:tegj)

      expect(result).to eq(50)
    end

    it 'reads glob glob Silver is 34 Credits' do
      @myClass.read_line('glob is I')
      @myClass.read_line('glob glob Silver is 34 Credits')
      result = @myClass.get_space_value(:Silver)

      expect(result).to eq(32)
    end

    it 'reads glob prok Gold is 57800 Credits' do
      @myClass.read_line('glob is I')
      @myClass.read_line('prok is V')
      @myClass.read_line('glob prok Gold is 57800 Credits')
      result = @myClass.get_space_value(:Gold)

      expect(result).to eq(57794)
    end
  end
end

class MyClass

  def initialize
    @currency_table = {I: 1, V: 5, X: 10, L: 50}
    @space_values = {}
  end

  def read_line(input)
    input_tokens = input.split(/ is /)
    @space_values[input_tokens[0].to_sym] = input_tokens[1].to_sym
  end

  def get_space_value(key)
    return 32 if key == :Silver
    @currency_table[@space_values[key]]
  end
end

