require_relative  'character'
require_relative  'player_shout'

class Player < Character
  def hit(obj)
    puts "Hit to #{obj} by Player"
  end

  # 叫ぶ。実際は敵を倒す弾を作る。
  def shout
    return PlayerShout.new(@director, @x, @y)
  end

  private

  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "player1.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end
