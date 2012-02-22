class CrashEffect < EffectBase
  def initialize(director, x, y, opts = {})
    super
    image_file = File.join(File.dirname(__FILE__), "..", "images", "enemy_crashed.png")
    @image = Image.load(image_file)
    @image.setColorKey([0, 0, 0])
    #@speed_x = 5
    #@speed_y = 5
  end

  def move
    #@x -= @speed_x
    #@y -= @speed_y
    remove #if @x < 0 || @y < 0
  end
end
