require_relative 'character'

class Box < Character

  # ふわふわした動きを表現
  def move
    @x += rand(3) - 1
    @y += rand(3) - 1
    reset_collision_pos
  end

  # オブジェクトとぶつかった時の判定
  def hit(obj)
    # プレイヤー以外とぶつかった場合はなにもしない
    return unless obj.class == Player
    # プレイヤーとぶつかったときの処理
    p "Damage to player!"
  end

  def crash
    crash_effect = CrashEffect.new(@director, @x, @y)
    @director.effects << crash_effect
    @director.boxes.delete_if {|box| box == self }
  end


  private

  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "enemy.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end
