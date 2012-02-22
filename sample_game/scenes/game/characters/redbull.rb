require_relative  'character'

class Redbull < Character

  def initialize(director, x, y, image_file = nil)
    super
    @count = 0
  end
  
  def move
    @count += 3
    if @count >= 5
      @count = 0
      @y += Math.tanh(@y)
      reset_collision_pos
    end
  end
  def remove
    @director.redbull.delete_if {|redbull| redbull == self }
  end
  def hit(obj)
    # プレイヤー以外とぶつかった場合はなにもしない
    return unless obj.class == Player
    remove
  end
  private
  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "enemy.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end 
end
