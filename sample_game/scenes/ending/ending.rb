# coding: Windows-31J

class Ending
  BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "ending_background.png")
  ENDING_ROLL_TEXT = File.join(File.dirname(__FILE__), "ending_roll.txt")

  def initialize
    # �w�i�摜�̓ǂݍ���
    @ending_image = Image.load(BACKGROUND_IMG)

    # �G���f�B���O���[���Ƃ��ė����e�L�X�g��z��Ɋi�[����
    @staff_roll = File.read(ENDING_ROLL_TEXT).split(/\n/)

    # ��`�����X�^�b�t���[�����A��ʍŉ�������ŏ㕔�܂ŃX�N���[��������B
    # ���̍ہA�F�͉��F�ŕ`�悷��悤�ɐݒ��ς��Ă݂�B
    @scroll_text = ScrollText.new(@staff_roll, :color => [255, 0, 255])
  end

  def draw
    # �w�i�摜�\����ɁA�X�N���[������e�L�X�g��`�悷��
    Window.draw(0, 0, @ending_image)
    @scroll_text.draw
  end

  # �V�[���`��
  # �X�y�[�X�L�[�܂��̓G���^�[�L�[���������ꂽ��v���O�������I������
  def play
    draw  # �G���f�B���O��ʂ�`��
    if Input.keyPush?(K_SPACE)
      Ugame.load_scenes
      Scene.set_current_scene(:title)
    end
  end
end
