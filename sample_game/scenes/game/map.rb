# coding: Windows-31J

class Map
  IMAGE_PATH = File.join(File.dirname(__FILE__), "images", "bg-playing1.png")

  def move
    @count = @count + 1 #������Ă΂ꂽ���m�F
    if (@count % 3) == 0 # �\�̔{���ɂȂ����� = 10�Ŋ��������܂肪0��������B��]�v�Z
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
