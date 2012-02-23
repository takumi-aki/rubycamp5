require_relative 'character'

# �L���̌��Ёi�A���t�@�x�b�g�̃s�[�X�j��\������B
class MemoryPiece < Character
  def initialize(director, x, y, alphabet = nil)
    @alphabet ||= ["ruby-r", "ruby-u", "ruby-b", "ruby-y",
                   "perl-p", "perl-e", "perl-r", "perl-l", ].sample
    super(director, x, y)
  end

  def move
    @y -= 0.5
    reset_collision_pos
    remove if @y < 0
  end
  
  def remove
    @director.memory_pieces.delete_if {|memory_piece| memory_piece == self}
  end

  def hit(obj)
    # �v���C���[�ȊO�Ȃ�Ȃɂ����Ȃ�
    return unless obj.class == Player
    # �v���C���[�Ɠ����������ʂ�������āA�擾�������Ѓ{�[�h�ɕ\��������
    remove
    @director.got_pieces << GotPiece.new(@director, @alphabet)
  end
  
  private
  
  def char_image(image_file = nil)
    # �����̎�ނɂ���ĉ摜��؂�ւ���
    image_file ||= File.join(File.dirname(__FILE__), "..", "images",  "#{@alphabet}.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end