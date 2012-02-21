require_relative 'character'

class Enemy < Character
  def move
    @x += rand(3) - 1
    @y += rand(3) - 1
    reset_collision_pos
  end

  def hit(obj)
    return unless obj.class == Player
    p "Damage to player!"
  end

  def crash
    crash_effect = CrashEffect.new(@director, @x, @y)
    @director.effects << crash_effect
    @director.enemies.delete_if {|enemy| enemy == self }
  end


  private

  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "enemy.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end
