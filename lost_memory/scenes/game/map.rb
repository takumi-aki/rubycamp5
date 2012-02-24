# coding: Windows-31J

class Map
  IMAGE_PATH = File.join(File.dirname(__FILE__), "images", "bg-playing1.png")
  GAGE_PATH  = File.join(File.dirname(__FILE__), "images","piece_board.png")
  def move
    @count = @count + 1 #今何回呼ばれたか確認
    if (@count % 100) == 0 # 200で割ったあまりが0だったら。剰余計算
      @d *= -1 #左右の変換
    end
    if (@count % 4) == 0
      @x = @x - @d
    end
  end 

  def initialize(player)
    @x = 0
    @count = 0
    @image = Image.load(IMAGE_PATH)
    @gage  = Image.load(GAGE_PATH)
    @d = 2
  end

  def draw
    Window.draw(@x,0,@image)
    Window.draw(640,440,@gage)
  end
end
