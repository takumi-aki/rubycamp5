# coding: Windows-31J

class Opening
# class Opening
#BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "title_background.png")
 BACKGROUND_IMG = [Image.load(File.join(File.dirname(__FILE__), "images", "opening1.PNG")),
		   Image.load(File.join(File.dirname(__FILE__), "images", "test1.JPG")),
		   Image.load(File.join(File.dirname(__FILE__), "images", "test2.JPG")),]
  def initialize
    #@title_image = Image.load(BACKGROUND_IMG)
     @title_images = BACKGROUND_IMG

    # �^�C�g����ʂɕ\��������������`
    str  =<<-EOF
�J�^�J�^�J�^�c
    EOF

    # �e�L�X�g�I�u�W�F�N�g�𐶐�
    # ���̗�̂悤�ɁA���������ɒ����Ȃ��Č��Â炢���́A�r���ŉ��s������
    # ���ǂ��B
    @describe_text = Text.new(str, x: 10, y: 250, font_size: 24,
                                     color: [255, 255, 255],  
                                     bold: true)

    # �Q�[���X�^�[�g�𑣂����b�Z�[�W���쐬
    @announce_text = Text.new("�X�y�[�X�L�[���������Ă��������B", 
                                color: [255, 255, 0],  # �t�H���g�F�����F�ɐݒ�
                                y: 380, bold: true)
    @cnt = 0.0
  end

  def draw
    Window.draw(0, 0, @title_images[@cnt.to_i])	#draw��title_images
    if @cnt.to_i < @title_images.size	#@cnt���G�̖����ȓ���������
       @cnt += 1.0 / 240			#240��draw���Ăяo�����Image���ς��
    end
    if @cnt.to_i == @title_images.size
      Scene.set_current_scene(:game)
    end
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
  end
end
