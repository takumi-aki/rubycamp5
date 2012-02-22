# coding: Windows-31J

class Title
  BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "title_background.png")

  def initialize
    @title_image = Image.load(BACKGROUND_IMG)

    # �^�C�g����ʂɕ\��������������`
    str  =<<-EOF
(��)�{�Q�[����Ruby���h2012�t5�ǂ̃V���[�e�B���O�Q�[���ł��B
    EOF

    # �e�L�X�g�I�u�W�F�N�g�𐶐�
    # ���̗�̂悤�ɁA���������ɒ����Ȃ��Č��Â炢���́A�r���ŉ��s������
    # ���ǂ��B
    @describe_text = Text.new(str, x: 10, y: 250, font_size: 24,
                                     color: [255, 255, 0],  # �t�H���g�F�����F�ɐݒ�
                                     bold: true)

    # �Q�[���X�^�[�g�𑣂����b�Z�[�W���쐬
    @announce_text = Text.new("Please �X�y�[�X�L�[", 
                                color: [255, 255, 0],  # �t�H���g�F�����F�ɐݒ�
                                y: 380, bold: true)
  end

  def draw
    Window.draw(0, 0, @title_image)

    # ��`�ς݂̃e�L�X�g���E�B���h�E�ɕ`�悷��
    @describe_text.draw
    @announce_text.draw
  end

  # �V�[���`��
  # �X�y�[�X�L�[���������ꂽ��V�[����؂�ւ��ăQ�[���V�[���ɑJ�ڂ���
  def play
    draw
    if Input.keyPush?(K_SPACE)
      Scene.set_current_scene(:game)
    end
    if Input.keyPush?(K_ESCAPE)
      exit
    end
  end
end
