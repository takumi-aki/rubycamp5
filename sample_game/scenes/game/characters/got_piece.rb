require_relative 'character'

# プレイヤーが集めた記憶の欠片を表示する
class GotPiece < Character
  LEFT_WIDTH  = 672
  RIGHT_WIDTH = 736
  UP_HEIGHT   = 472
  DOWN_HEIGHT = 536
  
  attr_accessor :type, :alphabet
  
  def initialize(director, type, alphabet)
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