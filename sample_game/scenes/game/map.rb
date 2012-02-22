# coding: Windows-31J

class Map
  IMAGE_PATH = File.join(File.dirname(__FILE__), "images", "bg-playing1.png")

  def initialize(player)
    @image = Image.load(IMAGE_PATH)
  end

  def draw
    Window.draw(0,0,@image)
  end
end
