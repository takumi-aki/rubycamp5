require_relative  'character'

# タイマーを表現する。
class Timer < Character
  def initialize(director, x, y, sec)
    @director = director
    @x, @y = x, y
    @sec = sec
    @timeouted = false
    @font = Font.new(32)
  end

  # タイマーを開始する。時間になったら@timeoutedがtrueになる。
  def start
    @start_time = Time.now
  end

  def timeouted?
    return @timeouted
  end

  # タイマーは動作しない。
  def move
  end

  def draw
    left_sec = @sec  - (Time.now - @start_time)
    if left_sec <= 0
      left_sec = 0
    end
    Window.drawFont(@x, @y, sprintf("%05.2f", left_sec), @font)
    if left_sec == 0
      @timeouted = true
      @sound = Sound.new(File.join(File.dirname(__FILE__), "box_collision_player.wav"))
      @sound.setVolume(255)
      @sound.play
      Scene.set_current_scene(:badend)
    end
  end
end
