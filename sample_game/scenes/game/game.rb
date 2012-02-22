require_relative File.join('characters', 'player')
require_relative File.join('characters', 'player_shout')
require_relative File.join('characters', 'box')
require_relative 'map'

# 視覚効果クラスの読み込み
require_relative File.join('effects', 'effect_base')
require_relative File.join('effects', 'crash_effect')


class Game
  attr_accessor :player, :boxes, :shouts, :effects, :map

  # シーン情報の初期化
  def initialize
    @player = Player.new(self, 400, 250)      # プレイヤーオブジェクトを生成
    @boxes  = [Box.new(self, 250, 170)]       # 敵キャラオブジェクトの配列を作成
    @shouts = []                              # 弾丸の配列を初期化
    @effects = []                             # 視覚効果オブジェクトの配列を初期化
    @map = Map.new(@player)                   # 背景マップ描画用オブジェクトを生成
    @memory_chips = []
  end

  # 本シーンの主描画メソッド
  def play
    # まずは背景マップの描画を行う（drawメソッドはスクロール実行も兼ねる）
    @map.draw

    # 画面上に描画するべき全ての要素を処理する
    draw_items.each do |char|
      char.move  # キャラクタに移動を命じる
      char.draw  # キャラクタの画像を画面に表示させる
    end

    # Xキーが押下されたらプレイヤーは弾を発射する
    if Input.keyPush?(K_X)
      return if @player.hp == 0
      @shouts << @player.shout#<<はpush配列にたくさんのオブジェクトを突っ込む、全部オブジェクトだからできる
    end

    check_collision # 当たり判定の一括処理
    check_clear     # ゲームクリア条件の判定処理
  end


  private

  # 画面上に描画するべき全ての要素を1つの配列として返す
  def draw_items
    return [@player] + @boxes + @shouts + @effects
  end

  # 画面上の全ての要素（キャラクタ）に対して、当たり判定を行う
  def check_collision
    collisions = draw_items.map{|c| c.collision }.compact
    Collision.check(collisions, collisions)
  end

  # ゲームのクリア条件を判定する
  # ※ ここでは単にリターンキーの押下でゲーム終了としている
  def check_clear
    if Input.keyPush?(K_RETURN)
      # シーンを切り替え、エンディングシーンへ遷移
      Scene.set_current_scene(:ending)
    end
  end
end
