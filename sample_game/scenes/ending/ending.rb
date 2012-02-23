# coding: Windows-31J

class Ending
  #BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "ending_background.png")

    @@staff_roll_type = :A     #�f�t�H���g
    @@image_type = :Ruby
  #�N���X���\�b�h
  def Ending.staff_roll_type=(value)
    @@staff_roll_type = value
  end
  #�N���X���\�b�h
  def Ending.image_type=(value)
    @@image_type = value
  end

  def initialize
    # �w�i�摜�̓ǂݍ���
    #@ending_image = Image.load(BACKGROUND_IMG)
    @bgm = Sound.new(File.join(File.dirname(__FILE__), "end.mid"))
    @first = true
  end

  def draw
    # �w�i�摜�\����ɁA�X�N���[������e�L�X�g��`�悷��
    Window.draw(0, 0, @ending_image)
    @scroll_text.draw
  end

  # �V�[���`��
  # �X�y�[�X�L�[�܂��̓G���^�[�L�[���������ꂽ��v���O�������I������
  def play
    if @first
      @bgm.play
    # �G���f�B���O���[���Ƃ��ė����e�L�X�g��z��Ɋi�[����
    staff_roll_path = File.join(File.dirname(__FILE__), "ending_roll_#{@@staff_roll_type}.txt")
    @staff_roll = File.read(staff_roll_path).split(/\n/)

    ending_image_path = File.join(File.dirname(__FILE__), "images", "image_#{@@image_type}.png")
    @ending_image = Image.load(ending_image_path)
    
    # ��`�����X�^�b�t���[�����A��ʍŉ�������ŏ㕔�܂ŃX�N���[��������B
    # ���̍ہA�F�͉��F�ŕ`�悷��悤�ɐݒ��ς��Ă݂�B
    @scroll_text = ScrollText.new(@staff_roll, :color => [255, 0, 255])

      @first = false
    end

    draw  # �G���f�B���O��ʂ�`��

    if Input.keyPush?(K_SPACE)
      Ugame.load_scenes
      Scene.set_current_scene(:title)
      @bgm.stop
    end
  end
end
