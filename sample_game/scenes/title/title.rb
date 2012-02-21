# coding: Windows-31J

class Title
  BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "title_background.png")

  def initialize
    @title_image = Image.load(BACKGROUND_IMG)

    # タイトル画面に表示する説明文を定義
    str  =<<-EOF
本ゲームはRuby合宿2012春のための学習サンプルです。
縦スクロール型シューティングゲームの素体です。
    EOF

    # テキストオブジェクトを生成
    # この例のように、引数が横に長くなって見づらい時は、途中で改行を入れて
    # も良い。
    @describe_text = Text.new(str, x: 10, y: 250, font_size: 24,
                                     color: [255, 255, 0],  # フォント色を黄色に設定
                                     bold: true)

    # ゲームスタートを促すメッセージを作成
    @announce_text = Text.new("スペースキーを押下してください。", 
                                color: [255, 255, 0],  # フォント色を黄色に設定
                                y: 380, bold: true)
  end

  def draw
    Window.draw(0, 0, @title_image)

    # 定義済みのテキストをウィンドウに描画する
    @describe_text.draw
    @announce_text.draw
  end

  # シーン描画
  # スペースキーが押下されたらシーンを切り替えてゲームシーンに遷移する
  def play
    draw
    if Input.keyPush?(K_SPACE)
      Scene.set_current_scene(:game)
    end
  end
end
