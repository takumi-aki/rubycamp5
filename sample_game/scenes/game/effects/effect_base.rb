class EffectBase
  attr_accessor :collision

  def initialize(director, x, y, opts = {})
    @director = director
    @x, @y = x, y
  end

  def move
  end

  def remove
    @director.effects.delete_if{|e| e == self }
  end

  def draw
    Window.draw(@x, @y, @image)
  end
end
