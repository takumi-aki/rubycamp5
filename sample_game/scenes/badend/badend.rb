# coding: Windows-31J

class Badend
  BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "badend_background.png")
  ENDING_ROLL_TEXT = File.join(File.dirname(__FILE__), "ending_roll.txt")

  def initialize
    @badend_image = Image.load(BACKGROUND_IMG)
    @bgm = Sound.new(File.join(File.dirname(__FILE__), "badend.mid"))
    @first = true
  end

  def draw
    Window.draw(0, 0, @badend_image)
  end

  # �V�[���`��
  # �X�y�[�X�L�[���������ꂽ��V�[����؂�ւ��Ď��̃V�[���ɑJ�ڂ���
  def play
    if @first
      @bgm.play
      @first = false
    end
  
    draw
    if Input.keyPush?(K_SPACE)
      Ugame.load_scenes
      Scene.set_current_scene(:title)
    end
    if Input.keyPush?(K_ESCAPE)
      exit
    end
  end
end
