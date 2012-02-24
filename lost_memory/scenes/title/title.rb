# coding: Windows-31J

class Title
  BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "title_background.png")

  def initialize
    @title_image = Image.load(BACKGROUND_IMG)
    # ゲームスタートを促すメッセージを作成
    @announce_text = Text.new("Please スペースキー", 
                                color: [255, 255, 0],  # フォント色を黄色に設定
                                y: 380, bold: true)
    @bgm = Sound.new(File.join(File.dirname(__FILE__), "title.mid"))
    @bgm.setVolume(210)
    @first = true
  end

  def draw
    Window.draw(0, 0, @title_image)
  end

  # シーン描画
  # スペースキーが押下されたらシーンを切り替えて次のシーンに遷移する
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
