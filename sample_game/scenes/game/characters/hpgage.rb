require_relative  'character'
require_relative 'player'

# HP�Q�[�W��\������B
class Hpgage < Character
  def initialize(director, x, y, image_file = nil)
    #@director = director
    #@x, @y = x, y
    super
  end

  #HP�Q�[�W�͓����Ȃ�
  def move
  end

  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "HP_100.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
  end
#  def draw
#    Window.draw(@x, @y,)
#  end
end
