# coding: Windows-31J

class Opening
# class Opening
#BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "title_background.png")
 BACKGROUND_IMG = [Image.load(File.join(File.dirname(__FILE__), "images", "opening1.PNG")),
		   Image.load(File.join(File.dirname(__FILE__), "images", "opening2.PNG")),
		   Image.load(File.join(File.dirname(__FILE__), "images", "opening3.PNG")),
                   Image.load(File.join(File.dirname(__FILE__), "images", "howto.PNG")),]
 KEYBOARD_IMG = Image.load(File.join(File.dirname(__FILE__),"images", "katakata.PNG"))

  def initialize
    #@title_image = Image.load(BACKGROUND_IMG)
     @title_images = BACKGROUND_IMG

     @katakata_positions = []

   # �e�L�X�g�I�u�W�F�N�g�𐶐�
    # ���̗�̂悤�ɁA���������ɒ����Ȃ��Č��Â炢���́A�r���ŉ��s������
    # ���ǂ��B

    # �Q�[���X�^�[�g�𑣂����b�Z�[�W���쐬
    @announce_text = Text.new("�V�[���X�L�b�v�FPUSH SPACE", 
                                color: [255, 0, 0],  # �t�H���g�F��ԐF�ɐݒ�
                                x:520,y: 580, bold: true)
    @cnt = 0.0
    @count = 0
    @bgm = Sound.new(File.join(File.dirname(__FILE__), "key.mid"))
    @first = true
  end

  def draw
    Window.draw(0, 0, @title_images[@cnt.to_i])	#draw��title_images
    if @cnt.to_i < @title_images.size	#@cnt���G�̖����ȓ���������
       @cnt += 1.0 / 250	#250��draw���Ăяo�����Image���ς��
    end
    if @cnt.to_i == @title_images.size
      Scene.set_current_scene(:game)
    end
    # ��`�ς݂̃e�L�X�g���E�B���h�E�ɕ`�悷��
    @announce_text.draw
   
    # �J�^�J�^����ʂɕ\������B
    if @cnt.to_i == 0
      # @count��4(1/150�b)�̔{���ɂȂ�����J�^�J�^��ǉ�����B
      if (@count % 4) == 0
        @katakata_positions << [rand(800),rand(600-150) + 150]
      end

      @katakata_positions.each do |(x, y)|
        Window.draw(x, y, KEYBOARD_IMG)
      end
    end
  end

  # �V�[���`��
  # �X�y�[�X�L�[���������ꂽ��V�[����؂�ւ��ăQ�[���V�[���ɑJ�ڂ���
  def play
    if @first
      @bgm.play
      @first = false
    end
    @count += 1
    draw
    if Input.keyPush?(K_SPACE)
      Scene.set_current_scene(:game)
    end
  end
end
