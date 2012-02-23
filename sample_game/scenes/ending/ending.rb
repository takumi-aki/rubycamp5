# coding: Windows-31J

class Ending
  BACKGROUND_IMG = File.join(File.dirname(__FILE__), "images", "ending_background.png")

    @@staff_roll_type = :A     #デフォルト
  #クラスメソッド
  def Ending.staff_roll_type=(value)
    @@staff_roll_type = value
  end

  def initialize
    # 背景画像の読み込み
    @ending_image = Image.load(BACKGROUND_IMG)

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
    # エンディングロールとして流すテキストを配列に格納する
    path = File.join(File.dirname(__FILE__), "ending_roll_Ruby_#{@@staff_roll_type}.txt")
    @staff_roll = File.read(path).split(/\n/)

    # 定義したスタッフロールを、画面最下部から最上部までスクロールさせる。
    # その際、色は黄色で描画するように設定を変えてみる。
    @scroll_text = ScrollText.new(@staff_roll, :color => [255, 0, 255])

      @first = false
    end
    draw  # エンディング画面を描画
    if Input.keyPush?(K_SPACE)
      Ugame.load_scenes
      Scene.set_current_scene(:title)
    end
  end
end
