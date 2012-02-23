require_relative 'character'
#require_relative 'memory_piece'

class PlayerShout < Character
  DEFAULT_HP = 400

  def initialize(director, x, y, hp = DEFAULT_HP)
    super(director, x, y)
    @hp = hp
    #@director = director
  end

  def move
    @y -= 10
    reset_collision_pos
    @hp -= 10
    remove if @hp <= 0
  end

  def remove
    @director.shouts.delete_if {|shout| shout == self }
  end

  def hit(obj)
    # �A�C�e���{�b�N�X�ȊO�Ȃ�Ȃɂ����Ȃ�
    return unless obj.class == Box
    remove
    obj.crash
    #@director.memory_pieces << MemoryPiece.new(self, 100, 100)
  end


  private

  def char_image(image_file = nil)
    image_file ||= File.join(File.dirname(__FILE__), "..", "images", "player_shout.png")
    img = Image.load(image_file)
    img.setColorKey([0, 0, 0])
    return img
  end
end
