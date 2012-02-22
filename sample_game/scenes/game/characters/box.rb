require_relative 'character'

class Box < Character
  def initialize(director, x, y, image_file = nil)
    super
    @count = 0
  end

  # ふわふわした動きを表現
  def move
    @count += 1
    if @count >= 20
      @count = 0
      @x += Math.cos(@x) * 9
      @y += Math.cos(@y) * 5
      reset_collision_pos
    end
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
