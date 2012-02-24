require_relative 'character'

# プレイヤーが集めた記憶の欠片を表示する
class GotPiece < Character
  #左上
  LEFT_UP_WIDTH     = 680
  LEFT_UP_HEIGHT    = 450
  #左下
  LEFT_DOWN_WIDH    = 670
  LEFT_DOWN_HEIGHT  = 495
  #右上
  RIGHT_UP_WIDTH    = 720
  RIGHT_UP_HEIGHT   = 460
  #右下
  RIGHT_DOWN_WIDTH  = 700
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

  # 動作しない
  def move
  end
  
  private
  
  def char_image(image_file = nil)
    # 文字の種類によって画像を切り替える
    image_file ||= File.join(File.dirname(__FILE__), "..", "images",  "#{@alphabet}.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end