require_relative 'character'

class Box < Character

  # �ӂ�ӂ킵��������\��
  def move
    @x += rand(3) - 1
    @y += rand(3) - 1
    reset_collision_pos
  end

  # �I�u�W�F�N�g�ƂԂ��������̔���
  def hit(obj)
    # �v���C���[�ȊO�ƂԂ������ꍇ�͂Ȃɂ����Ȃ�
    return unless obj.class == Player
    # �v���C���[�ƂԂ������Ƃ��̏���
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
