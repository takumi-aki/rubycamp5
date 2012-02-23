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

    # タイトル画面に表示する説明文を定義
    str  =<<-EOF
カタカタカタ…
    EOF

    # テキストオブジェクトを生成
    # この例のように、引数が横に長くなって見づらい時は、途中で改行を入れて
    # も良い。
    @describe_text = Text.new(str, x: 10, y: 250, font_size: 24,
                                     color: [255, 255, 255],  
                                     bold: true)

    # ゲームスタートを促すメッセージを作成
    @announce_text = Text.new("スペースキーを押下してください。", 
                                color: [255, 255, 0],  # フォント色を黄色に設定
                                y: 380, bold: true)
    @cnt = 0.0
  end

  def draw
    Window.draw(0, 0, @title_images[@cnt.to_i])	#drawがtitle_images
    if @cnt.to_i < @title_images.size	#@cntが絵の枚数以内だったら
       @cnt += 1.0 / 240			#240回drawが呼び出されてImageが変わる
    end
    if @cnt.to_i == @title_images.size
      Scene.set_current_scene(:game)
    end
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
