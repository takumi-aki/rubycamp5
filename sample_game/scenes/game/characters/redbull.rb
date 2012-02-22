require_relative  'character'

class Redbull < Character

  def initialize(director, x, y, image_file = nil)
    super
    @count = 0
  end
  
  def move
    @count += 1
    if @count >= 20
      @count = 0
      @y += Math.cos(@y)
      reset_collision_pos
    end
  end
  # �I�u�W�F�N�g�ƂԂ��������̔���
  def hit(obj)
    # �v���C���[�ȊO�ƂԂ������ꍇ�͂Ȃɂ����Ȃ�
    return unless obj.class == Player
  end
  def remove
    @director.redbull.delete_if {|redbull| redbull == self }
  end
  private
  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "enemy.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end 
end
