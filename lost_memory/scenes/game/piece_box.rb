class PieceBox
  COMPLATE_SIZE = 4
  
  attr_accessor :ruby, :perl

  def initialize
    @ruby = Hash.new(0)
    @perl = Hash.new(0)
  end
  
  def add(piece)
    case piece.type
    when :ruby
      @ruby[piece.alphabet] += 1
    when :perl
      @perl[piece.alphabet] += 1
    end
  end
  
  def different?
    @ruby.size > 0 && @perl.size > 0
  end
  
  def complate?(type)
    case type
    when :ruby
      @ruby.size == COMPLATE_SIZE
    when :perl
      @perl.size == COMPLATE_SIZE
    end
  end

  def reset
    @ruby = Hash.new(0)
    @perl = Hash.new(0)
  end
end