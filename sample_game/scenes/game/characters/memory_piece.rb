require_relative 'character'

# 記憶の欠片（アルファベットのピース）を表現する。
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
    # プレイヤー以外ならなにもしない
    return unless obj.class == Player
    # プレイヤーと当たったら画面から消して、取得した欠片ボードに表示させる
    remove
    @director.got_pieces << GotPiece.new(@director, @alphabet)
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