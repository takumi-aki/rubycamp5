# coding: Windows-31J

class Opening
  BACKGROUND_IMG = [
    Image.load(File.join(File.dirname(__FILE__), "images", "opening1.PNG")),
    Image.load(File.join(File.dirname(__FILE__), "images", "opening2.PNG")),
    Image.load(File.join(File.dirname(__FILE__), "images", "opening3.PNG")),
    Image.load(File.join(File.dirname(__FILE__), "images", "howto.PNG")),
  ]
  KEYBOARD_IMG = Image.load(File.join(File.dirname(__FILE__),"images", "katakata.PNG"))

  def initialize
     @title_images = BACKGROUND_IMG

     @katakata_positions = []

    # テキストオブジェクトを生成
    # この例のように、引数が横に長くなって見づらい時は、途中で改行を入れて
    # も良い。

    # ゲームスタートを促すメッセージを作成
    @announce_text = Text.new("シーンスキップ：PUSH SPACE", 
                                color: [255, 0, 0],  # フォント色を赤色に設定
                                x:520,y: 580, bold: true)
    @cnt = 0.0
    @count = 0
    @bgm = Sound.new(File.join(File.dirname(__FILE__), "opening.wav"))
    @bgm.setVolume(255)#ヴォリューム
    @first = true
  end

  def draw
    Window.draw(0, 0, @title_images[@cnt.to_i])	#drawがtitle_images
    if @cnt.to_i < @title_images.size	#@cntが絵の枚数以内だったら
       @cnt += 1.0 / 290	#290回drawが呼び出されてImageが変わる
    end
    if @cnt.to_i == @title_images.size
      Scene.set_current_scene(:game)
    end
    # 定義済みのテキストをウィンドウに描画する
    @announce_text.draw
   
    # カタカタを画面に表示する。
    if @cnt.to_i == 0
      # @countが4(1/150秒)の倍数になったらカタカタを追加する。
      if (@count % 4) == 0
        @katakata_positions << [rand(800),rand(600-150) + 150]
      end

      @katakata_positions.each do |(x, y)|
        Window.draw(x, y, KEYBOARD_IMG)
      end
    end
  end

  # シーン描画
  # スペースキーが押下されたらシーンを切り替えてゲームシーンに遷移する
  def play
    if @first
      @bgm.play
      @first = false
    end
    @count += 1
    draw
    if Input.keyPush?(K_SPACE)
      Scene.set_current_scene(:game)
      @bgm.stop
    end
  end
end
