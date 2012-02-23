# coding: Windows-31J

class Title
  BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "title_background.png")

  def initialize
    @title_image = Image.load(BACKGROUND_IMG)
    # �Q�[���X�^�[�g�𑣂����b�Z�[�W���쐬
    @announce_text = Text.new("Please �X�y�[�X�L�[", 
                                color: [255, 255, 0],  # �t�H���g�F�����F�ɐݒ�
                                y: 380, bold: true)
    @bgm = Sound.new(File.join(File.dirname(__FILE__), "title.mid"))
    @bgm.setVolume(210)
    @first = true
  end

  def draw
    Window.draw(0, 0, @title_image)
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
      Scene.set_current_scene(:opening)
      @bgm.stop
    end
    if Input.keyPush?(K_ESCAPE)
      @bgm.stop
      exit
    end
  end
end
