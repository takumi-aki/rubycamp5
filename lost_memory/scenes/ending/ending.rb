# coding: Windows-31J

class Ending
    @@staff_roll_type = :A     #デフォルト
    @@image_type = :Ruby
  #クラスメソッド
  def Ending.staff_roll_type=(value)
    @@staff_roll_type = value
  end
  #クラスメソッド
  def Ending.image_type=(value)
    @@image_type = value
  end

  def initialize
    # 背景画像の読み込み
    @bgm = Sound.new(File.join(File.dirname(__FILE__), "end.mid"))
    @bgm.setVolume(250)
    @first = true
  end

  def draw
    # 背景画像表示後に、スクロールするテキストを描画する
    Window.draw(0, 0, @ending_image)
    @scroll_text.draw
  end

  # シーン描画
  # スペースキーまたはエンターキーが押下されたらプログラムを終了する
  def play
    if @first
      @bgm.play
    # エンディングロールとして流すテキストを配列に格納する
    staff_roll_path = File.join(File.dirname(__FILE__), "ending_roll_#{@@staff_roll_type}.txt")
    @staff_roll = File.read(staff_roll_path).split(/\n/)

    ending_image_path = File.join(File.dirname(__FILE__), "images", "image_#{@@image_type}.png")
    @ending_image = Image.load(ending_image_path)
    
    # 定義したスタッフロールを、画面最下部から最上部までスクロールさせる。
    # その際、色は黄色で描画するように設定を変えてみる。
    @scroll_text = ScrollText.new(@staff_roll, :color => [255, 0, 255])

      @first = false
    end

    draw  # エンディング画面を描画

    if Input.keyPush?(K_SPACE)
      Ugame.load_scenes
      Scene.set_current_scene(:title)
      @bgm.stop
    end
  end
end
