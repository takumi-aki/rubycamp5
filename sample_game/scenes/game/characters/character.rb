class Character
  attr_accessor :collision, :x, :y

  def initialize(director, x = 400, y = 550, image_file = nil)
    @director = director
    @x, @y = x, y
    @image = char_image(image_file)
    @distance  = 3
    @collision = CollisionBox.new(self, 0, 0,
                                  @image.width, @image.height)
  end

  def move
    dx = Input.x * @distance
    dy = Input.y * @distance
    @x += dx if valid_x_range?(dx)
    @y += dy if valid_y_range?(dy)
    reset_collision_pos
  end

  def draw
    Window.draw(@x, @y, @image)
  end

  private

  def reset_collision_pos
    self.collision.set(@x, @y)
  end

  def valid_x_range?(dx)
    !((@x + dx + @image.width) > Window.width || (@x + dx) < 0)
  end

  def valid_y_range?(dy)
    !((@y + dy + @image.height) > Window.height || (@y + dy) < 0)
  end
end
