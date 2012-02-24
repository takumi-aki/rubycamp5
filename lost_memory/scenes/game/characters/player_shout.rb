require_relative 'character'

class PlayerShout < Character
  DEFAULT_HP = 400

  def initialize(director, x, y, hp = DEFAULT_HP)
    super(director, x, y)
    @hp = hp
    #@director = director
  end

  def move
    @y -= 10
    reset_collision_pos
    @hp -= 10 if @hp > 0
    remove if @hp <= 0
  end

  def remove
    @director.shouts.delete_if {|shout| shout == self }
  end

  def hit(obj)
    # アイテムボックス以外ならなにもしない
    return unless obj.class == Box
    remove
    obj.crash
    @sound = Sound.new(File.join(File.dirname(__FILE__), "hit_shout.wav"))
    @sound.setVolume(255)
    @sound.play
  end

  private

  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "player_shout.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end
