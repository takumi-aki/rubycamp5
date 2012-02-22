require_relative 'character'

class PlayerShout < Character
  def move
    @y -= 10
    reset_collision_pos
    remove if @y < 0
  end

  def remove
    @director.shots.delete_if {|shot| shot == self }
  end

  def hit(obj)
    # アイテムボックス以外ならなにもしない
    return unless obj.class == Box
    remove
    obj.crash
  end


  private

  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "player_shot.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end
