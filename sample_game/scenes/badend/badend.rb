# coding: Windows-31J

class Badend
  BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "badend_background.png")
  ENDING_ROLL_TEXT = File.join(File.dirname(__FILE__), "ending_roll.txt")

  def initialize
    @badend_image = Image.load(BACKGROUND_IMG)
  end

  def draw
    Window.draw(0, 0, @badend_image)
  end

  # シーン描画
  # スペースキーが押下されたらシーンを切り替えて次のシーンに遷移する
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
