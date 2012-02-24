require_relative 'character'

class Box < Character
  def initialize(director, x, y, image_file = nil)
    super(director, x, y)
    @count = 0
    @director = director
  end

  # ふわふわした動きを表現
  def move
      @count = 0
      @x += Math.cos(@y) * 5
      @y += Math.cos(@x) * 5
      reset_collision_pos
    #end
  end

  # オブジェクトとぶつかった時の判定
  def hit(obj)
    # プレイヤー以外とぶつかった場合はなにもしない
    return unless obj.class == Player
    # プレイヤーとぶつかったときの処理
    @sound = Sound.new(File.join(File.dirname(__FILE__), "box_collision_player.wav"))
    @sound.setVolume(255)
    @sound.play
    @director.bgm.stop
    Scene.set_current_scene(:badend)
  end

  def crash
    crash_effect = CrashEffect.new(@director, @x, @y)
    @director.effects << crash_effect
    @director.boxes.delete_if {|box| box == self }
    @director.memory_pieces << MemoryPiece.new(@director,@x,@y)
  end


  private

  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "enemy.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end
