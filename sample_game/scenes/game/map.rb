# coding: Windows-31J

class Map
  IMAGE_PATH = File.join(File.dirname(__FILE__), "images", "bg-playing1.png")

  def move
    @count = @count + 1 #今何回呼ばれたか確認
    if (@count % 3) == 0 # 十の倍数になったら = 10で割ったあまりが0だったら。剰余計算
      @x = @x + 1
    end
    
  end

  def initialize(player)
    @x = 0
    @count = 0
    @image = Image.load(IMAGE_PATH)
  end

  def draw
    Window.draw(@x,0,@image)
  end
end
