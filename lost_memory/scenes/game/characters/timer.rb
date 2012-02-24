require_relative  'character'

# �^�C�}�[��\������B
class Timer < Character
  def initialize(director, x, y, sec)
    @director = director
    @x, @y = x, y
    @sec = sec
    @timeouted = false
    @font = Font.new(32)
    # @font_color_yellow = [255, 255, 0]
  end

  # �^�C�}�[���J�n����B���ԂɂȂ�����@timeouted��true�ɂȂ�B
  def start
    @start_time = Time.now
  end

  def timeouted?
    return @timeouted
  end

  # �^�C�}�[�͓��삵�Ȃ��B
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
