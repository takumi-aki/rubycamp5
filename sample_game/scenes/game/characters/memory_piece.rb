require_relative 'character'

# 記憶の欠片（アルファベットのピース）を表現する。
class MemoryPiece < Character
  attr_reader :type
  
  def initialize(director, x, y, type = nil, alphabet = nil)
    # ランダムにタイプを決める（:rubyか:perl）
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

  # プレイヤーと当たったら画面から消して、取得した欠片ボードに表示させる
  def hit(obj)
    # プレイヤー以外ならなにもしない
    return unless obj.class == Player
    
    remove
    
    @director.got_pieces << GotPiece.new(@director, @type, @alphabet)
    piece = GotPiece.new(@director, @type, @alphabet)
    @director.piece_box.add(piece)
    
    @sound = Sound.new(File.join(File.dirname(__FILE__), "get_piece.wav"))
    @sound.setVolume(255)
    @sound.play
    
    # もし違う種類の欠片を手に入れたら、リセットする。
    if @director.piece_box.different?
      @director.got_pieces = []
      @director.piece_box.reset
      
      @sound = Sound.new(File.join(File.dirname(__FILE__), "piece_miss.wav"))
      @sound.setVolume(255)
      @sound.play
    end
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