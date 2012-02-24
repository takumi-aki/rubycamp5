# coding: Windows-31J

# �Q�[���E�B���h�E��֕`�悷�镶������Ǘ�����N���X��`
class Text
  # �e�L�X�g�̕`����W�͌ォ��擾�ł���悤�A�A�N�Z�T���\�b�h���`���Ă���
  attr_reader :x, :y

  # �E�B���h�E�`�敶���񂪔�����ׂ�������ݒ肷�鏉���������B
  def initialize(text, opt = {})
    # �I�u�W�F�N�g���`�悷�ׂ��e�L�X�g���e���C���X�^���X�ϐ��Ɋm�ہB
    @text = text

    # �p�����[�^�l�̎󂯎��i�w�肪�������̂ɂ̓f�t�H���g�l��K�p����j
    @x     = opt[:x]       # �e�L�X�g�`��ʒu��X���W
    @y     = opt[:y] || 0  # �e�L�X�g�`��ʒu��Y���W
    @alpha = opt[:alpha] || 255             # ���l�i�����x�j�B255�͊��S�s�����B0������
    @color = opt[:color] || [255, 255, 255] # �\���F�BRGB��3���F��z��Ŏw�肷��B

    # �t�H���g�̒�`���󂯎��
    font_name = opt[:font_name]  || "�l�r �S�V�b�N"
    font_size = opt[:font_size]  || 20
    bold      = opt[:bold]        || false
    italic    = opt[:italic]      || false

    # �`��Ɏg�p����t�H���g�̐���
    @font = Font.new(font_size, font_name, weight: bold, italic: italic)

    # @x�̒l���w�肳��Ă��Ȃ����́A�Z���^�����O���ĕ\������悤�A@x���v�Z����B
    # �uWindow.width�v�ŃE�B���h�E�̉������A�u@font.getWidth(@text)�v�Ńe�L�X�g
    # �̕`�掞�̉��������ꂼ��擾�ł���̂ŁA�������璆���l���v�Z�B
    @x = (Window.width - @font.getWidth(@text)) / 2 unless @x
  end

  # ���������Ȃ̂Ńe�L�X�g���X�N���[���ł���悤�ɂ��Ă݂�
  def scroll(dy)
    # 1�t���[���ňړ�����X�N���[����dy���󂯎��A�e�L�X�g�̕`����W�i��Y���W�j
    # �ɑ������ށB
    # �{���\�b�h���s���draw���\�b�h���Ăяo���ƁAdy > 0 �Ȃ�Ή������փX�N���[�����A
    # dy < 0 �Ȃ�Ώ�����փX�N���[������B
    @y += dy
  end

  # ���ۂɃE�B���h�E��̓�����W�Ƀe�L�X�g��`�悷�郁�\�b�h��`
  def draw
    Window.drawFont(@x, @y, @text, @font, alpha: @alpha, color: @color)
  end
end
