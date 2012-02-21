require_relative  'character'

class Player < Character
  def hit(obj)
    puts "Hit to #{obj} by Player"
  end

  private

  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "player.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end
