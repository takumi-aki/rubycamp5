require_relative 'character'

class MemoryChip < Character
  def initialize(director, x, y)
    super(director, x, y)
    @alphabet = ("a".."z").to_a[(rand(26) + 1)]
  end

  def move
    #@y -= 2
    reset_collision_pos
    remove if @y < 0
  end
  
  def remove
    @director.memory_chips.delete_if {|memory_chip| memory_chip == self}
  end
  
  def hit(obj)
    # プレイヤー以外ならなにもしない
    return unless obj.class == Player
    remove
  end
  
  private
  
  def char_image(image_file = nil)
    # 文字の種類によって画像を切り替える
    #image_file ||= File.join(File.dirname(__FILE__), "..", "images",  "#{@alphabet}.png")
    image_file ||= File.join(File.dirname(__FILE__), "..", "images",  "enemy_crashed.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end