require_relative  'character'

class Redbull < Character

  def initialize(director, x, y, image_file = nil)
    super
    @count = 0
  end

  def move
    @count += 2
    if @count >= 8
      @count = 0
      @y += Math.tanh(@y)
      reset_collision_pos
    end
  end

  def remove
    @director.redbulls.delete_if {|redbull| redbull == self }
  end


  def hit(obj)
    # プレイヤー以外とぶつかった場合はなにもしない
    return unless obj.class == Player
    remove
    recovery
    @sound = Sound.new(File.join(File.dirname(__FILE__), "get_redbull.wav"))
    @sound.setVolume(255)
    play
  end

  private
  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "redbul.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
  
  def recovery
    @director.player.hp = 400
  end

  def play
    @sound.play
  end

  def stop
    @sound.stop
  end
end
