require_relative 'character'

# �L���̌��Ёi�A���t�@�x�b�g�̃s�[�X�j��\������B
class MemoryPiece < Character
  attr_reader :type
  
  def initialize(director, x, y, type = nil, alphabet = nil)
    # �����_���Ƀ^�C�v�����߂�i:ruby��:perl�j
    @type ||= rand(2) == 1 ? :ruby : :perl
    
    case @type
    when :ruby
      @alphabet ||= ["ruby-r", "ruby-u", "ruby-b", "ruby-y"].sample
    when :perl
      @alphabet ||= ["perl-p", "perl-e", "perl-r", "perl-l"].sample
    end
    
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

  # �v���C���[�Ɠ����������ʂ�������āA�擾�������Ѓ{�[�h�ɕ\��������
  def hit(obj)
    # �v���C���[�ȊO�Ȃ�Ȃɂ����Ȃ�
    return unless obj.class == Player
    
    remove
    
    @director.got_pieces << GotPiece.new(@director, @type, @alphabet)
    piece = GotPiece.new(@director, @type, @alphabet)
    @director.piece_box.add(piece)
    
    p @director.piece_box
    
    # �����Ⴄ��ނ̌��Ђ���ɓ��ꂽ��A���Z�b�g����B
    if @director.piece_box.different?
      @director.got_pieces = []
      @director.piece_box.reset
    end
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