# coding: Windows-31J

class Map
  IMAGE_PATH = File.join(File.dirname(__FILE__), "images", "bg-playing1.png")

  def move
    @count = @count + 1 #������Ă΂ꂽ���m�F
    if (@count % 100) == 0 # 200�Ŋ��������܂肪0��������B��]�v�Z
      @d *= -1 #���E�̕ϊ�
    end
    if (@count % 4) == 0
      @x = @x - @d
    end
  end

  def initialize(player)
    @x = 0
    @count = 0
    @image = Image.load(IMAGE_PATH)
    @d = 2
  end

  def draw
    Window.draw(@x,0,@image)
  end
end
