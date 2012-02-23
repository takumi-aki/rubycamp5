# coding: Windows-31J

class Title
  BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "title_background.png")

  def initialize
    @title_image = Image.load(BACKGROUND_IMG)

    # ゲームスタートを促すメッセージを作成
    @announce_text = Text.new("Please スペースキー", 
                                color: [255, 255, 0],  # フォント色を黄色に設定
                                y: 380, bold: true)
  end

  def draw
    Window.draw(0, 0, @title_image)

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
