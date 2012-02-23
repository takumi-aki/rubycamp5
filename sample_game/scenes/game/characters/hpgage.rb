require_relative  'character'

# HPゲージを表現する。
class Hpgage < Character
  def initialize(obj, x, y, player)
    @images = [
      Image.load(File.join(File.dirname(__FILE__), "..", "images", "HP_0.png")),
      Image.load(File.join(File.dirname(__FILE__), "..", "images", "HP_25.png")),
      Image.load(File.join(File.dirname(__FILE__), "..", "images", "HP_50.png")),
      Image.load(File.join(File.dirname(__FILE__), "..", "images", "HP_75.png")),
      Image.load(File.join(File.dirname(__FILE__), "..", "images", "HP_100.png")),
    ]
    @images.each do |img|
      img.setColorKey([255, 255, 255])
    end
    @player = player
    super(obj, x, y)
  end

  #HPゲージは動かない
  def move
    @image = current_image
  end

  def current_image
    case @player.hp
    when 0
      return @images[0]
    when 1..100
      return @images[1]
    when 101..200
      return @images[2]
    when 201..300
      return @images[3]
    when 301..400
      return @images[4]
    end
  end

  def char_image(image_file = nil)
    return current_image
  end
end
