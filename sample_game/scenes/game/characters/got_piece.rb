require_relative 'character'

# �v���C���[���W�߂��L���̌��Ђ�\������
class GotPiece < Character
  #����
  LEFT_UP_WIDTH     = 680
  LEFT_UP_HEIGHT    = 450
  #����
  LEFT_DOWN_WIDH    = 670
  LEFT_DOWN_HEIGHT  = 495
  #�E��
  RIGHT_UP_WIDTH    = 720
  RIGHT_UP_HEIGHT   = 460
  #�E��
  RIGHT_DOWN_WIDTH  = 703
  RIGHT_DOWN_HEIGHT = 503
  
  attr_accessor :type, :alphabet
  
  def initialize(director, type, alphabet)
    case alphabet
    when "ruby-r", "perl-p"
      x = LEFT_UP_WIDTH
      y = LEFT_UP_HEIGHT
    when "ruby-u", "perl-e"
      x = RIGHT_UP_WIDTH
      y = RIGHT_UP_HEIGHT
    when "ruby-b", "perl-r"
      x = LEFT_DOWN_WIDH
      y = LEFT_DOWN_HEIGHT
    when "ruby-y", "perl-l"
      x = RIGHT_DOWN_WIDTH
      y = RIGHT_DOWN_HEIGHT
    end
    
    @type = type
    @alphabet = alphabet
    super(director, x, y)
  end

  # ���삵�Ȃ�
  def move
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