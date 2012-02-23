require_relative 'character'

# �v���C���[���W�߂��L���̌��Ђ�\������
class GotPiece < MemoryPiece
  LEFT_WIDTH  = 672
  RIGHT_WIDTH = 736
  UP_HEIGHT   = 472
  DOWN_HEIGHT = 536
  
  def initialize(director, alphabet)
    case alphabet
    when "ruby-r", "perl-p"
      x = LEFT_WIDTH
      y = UP_HEIGHT
    when "ruby-u", "perl-e"
      x = RIGHT_WIDTH
      y = UP_HEIGHT
    when "ruby-b", "perl-r"
      x = LEFT_WIDTH
      y = DOWN_HEIGHT
    when "ruby-y", "perl-l"
      x = RIGHT_WIDTH
      y = DOWN_HEIGHT
    end
    
    @alphabet = alphabet
    super(director, x, y)
  end

  # ���삵�Ȃ�
  def move
  end
  
  def char_image(image_file = nil)
    # �����̎�ނɂ���ĉ摜��؂�ւ���
    image_file ||= File.join(File.dirname(__FILE__), "..", "images",  "#{@alphabet}.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end