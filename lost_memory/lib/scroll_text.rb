# coding: Windows-31j

# スクロール機能付き文字列
class ScrollText
  def initialize(roll_text_ary, opt = {})
    @start_y   = opt[:start_y] || Window.height   # スクロール開始地点
    @end_y     = opt[:end_y] || -100              # スクロール終端点
    @x         = opt[:x] || 10                     # 描画開始点のX座標値
    @dy        = opt[:dy] || -1                    # スクロール量・方向
    @font_size = opt[:font_size] || 24           # 描画フォントのサイズ
    @color     = opt[:color] || [255, 255, 255]   # 描画色
    @interval  = opt[:interval] || 32            # 行毎の間隔

    # スクロール対象となる文字列を集めた配列を定義
    @view_ary = roll_text_ary

    # 1行ずつゆっくり間隔を空けてスクロールするための遅延管理に使うカウンタを初期化
    @scroll_cnt = 0

    # 現在何行目のエンディングロールを追加しているかを管理する変数を定義
    @current_row = 0

    # 画面に描画し続けるテキストを保持する空配列を用意
    @temp_roll  = []

    # 画面描画用配列に最初の1行を追加して、ポジション保持変数を1進める
    add_roll_text(@view_ary[@current_row])
    @current_row += 1
  end

  # 1フレーム分スクロール描画を実行するメソッド
  def draw
    # 画面描画用配列に格納されている各行を描画し、それぞれ1ピクセル上へスクロールさせる
    @temp_roll.each_with_index do |text, idx|
      text.scroll(@dy)
      text.draw

      # スクロールし終えたら、配列から該当行を削除する。
      # スクロール終端点の判定はスクロール方向によって異なるので、場合分けする。
      if @dy < 0
        @temp_roll.delete_at(idx) if text.y < @end_y
      else
        @temp_roll.delete_at(idx) if text.y > @end_y
      end
    end

    # @staff_rollの行数分を超えないよう、制御する
    if @current_row < @view_ary.size

      # スクロール制御用のカウンタ値を1進める
      @scroll_cnt += 1

      # スクロール制御用のカウンタが一定量に達したら、画面描画用配列に1行を追加して、
      # ポジション保持変数を1進め、スクロール制御用カウンタをクリアする
      if @scroll_cnt == @interval
        add_roll_text(@view_ary[@current_row])
        @current_row += 1
        @scroll_cnt = 0
      end
    end
  end


  # クラス内部でしか使われる可能性の無いメソッドは、private
  # 宣言してから定義すると、外部からうっかり呼ばれることが無くなる。
  private

  # 画面表示用配列に新たな行を追加するプライベートメソッド定義
  def add_roll_text(text)
    @temp_roll << Text.new(text, x: @x, y: @start_y,
                           font_size: @font_size,
                           color: @color)
  end
end