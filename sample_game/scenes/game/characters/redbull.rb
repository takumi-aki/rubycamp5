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
    # �v���C���[�ȊO�ƂԂ������ꍇ�͂Ȃɂ����Ȃ�
    return unless obj.class == Player
    remove
    recovery
  end

  private
  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "redbul.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
  
  def recovery
    @director.player.hp = 300
  end
end
