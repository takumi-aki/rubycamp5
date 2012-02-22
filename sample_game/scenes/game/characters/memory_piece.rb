require_relative 'character'

class MemoryPiece < Character
  def move
    #@y -= 2
    reset_collision_pos
    remove if @y < 0
  end
  
  def remove
    @director.memory_pieces.delete_if {|memory_piece| memory_piece == self}
  end
  
  def hit(obj)
    # �v���C���[�ȊO�Ȃ�Ȃɂ����Ȃ�
    return unless obj.class == Player
    remove
  end
  
  private
  
  def char_image(image_file = nil)
    alphabet = ["ruby-r", "ruby-u", "ruby-b", "ruby-y",
                "perl-p", "perl-e", "perl-r", "perl-l", ].sample
    # �����̎�ނɂ���ĉ摜��؂�ւ���
    image_file ||= File.join(File.dirname(__FILE__), "..", "images",  "#{alphabet}.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end