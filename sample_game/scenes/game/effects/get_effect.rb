class GetEffect < EffectBase
  def initialize(director, x, y, opts = {})
    super
     # �A�C�e�����Q�b�g�����Ƃ��̉摜
    image_file = File.join(File.dirname(__FILE__), "..", "images", "enemy_crashed.png")
    @image = Image.load(image_file)
    @image.setColorKey([0, 0, 0])
    #@speed_x = 5
    #@speed_y = 5
    #�摜�𕡐��̃`�b�v�ɂ킯�AGET�����Ƃ��̃G�t�F�N�g
    #temp = Image.load(image_file)
    #chip_width  = temp.width / chip_size
    #chip_height = temp.height / chip_size
    #@images = Image.loadToArray(image_file, chip_width, chip_height)
    #@images = @images.map{|i| i.setColorKey([0, 0, 0]) }
    #@counter = 0.0
  end
  #

  #def move
   # @x -= @speed_x
   # @y -= @speed_y
    #remove #if @x < 0 || @y < 0
  end
end
