# coding: Windows-31J

class Title
  BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "title_background.png")

  def initialize
    @title_image = Image.load(BACKGROUND_IMG)

    # �Q�[���X�^�[�g�𑣂����b�Z�[�W���쐬
    @announce_text = Text.new("Please �X�y�[�X�L�[", 
                                color: [255, 255, 0],  # �t�H���g�F�����F�ɐݒ�
                                y: 380, bold: true)
  end

  def draw
    Window.draw(0, 0, @title_image)

  end

  # �V�[���`��
  # �X�y�[�X�L�[���������ꂽ��V�[����؂�ւ��Ď��̃V�[���ɑJ�ڂ���
  def play
    draw
    if Input.keyPush?(K_SPACE)
      Scene.set_current_scene(:opening)
    end
    if Input.keyPush?(K_ESCAPE)
      exit
    end
  end
end
