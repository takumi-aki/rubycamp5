require_relative  'character'
require_relative  'player_shout'

class Player < Character
  attr_accessor :hp
  attr_reader :x, :y
  def initialize(obj, x, y)
    super(obj, x, y)
    @hp = 400
  end

  # ‹©‚ÔBŽÀÛ‚Í“G‚ð“|‚·’e‚ðì‚éB
  def shout
    @hp -= 10 if @hp > 0
    return PlayerShout.new(@director, @x, @y ,@hp)
  end

  private

  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "player1.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end
