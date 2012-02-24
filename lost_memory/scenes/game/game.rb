require_relative File.join('characters', 'player')
require_relative File.join('characters', 'player_shout')
require_relative File.join('characters', 'box')
require_relative File.join('characters', 'memory_piece')
require_relative File.join('characters', 'timer')
require_relative File.join('characters', 'redbull')
require_relative File.join('characters', 'hpgage')
require_relative File.join('characters', 'got_piece')
require_relative 'map'
require_relative 'piece_box'

# 視覚効果クラスの読み込み
require_relative File.join('effects', 'effect_base')
require_relative File.join('effects', 'crash_effect')

class Game
  attr_accessor :player, :boxes, :shouts, :effects, :map, :timer, :hpgage, 
                :redbulls, :memory_pieces, :piece_box, :got_pieces, :bgm
  # シーン情報の初期化
  def initialize
    @player = Player.new(self, 400, 250)      # プレイヤーオブジェクトを生成
    @boxes  = []                              # 敵キャラオブジェクトの配列を作成
    @memory_pieces = []                       # 記憶のかけらの配列を作成
    @shouts = []                              # 弾丸の配列を初期化
    @effects = []                             # 視覚効果オブジェクトの配列を初期化
    @map = Map.new(@player)                   # 背景マップ描画用オブジェクトを生成
    @timer = Timer.new(self, 0, 0, 60)        #タイマーオブジェクトを生成
    @first = true			      #
    @hpgage = Hpgage.new(self, 272, 570, @player)      #HPゲージ追加
    @redbulls = []
    @got_pieces = []                         # 入手した記憶の欠片の配列（描画用）
    @piece_box = PieceBox.new                # 入手した記憶の欠片管理用のクラス作成
    @bgm = Sound.new(File.join(File.dirname(__FILE__), "bgm.mid"))
    @sound = Sound.new(File.join(File.dirname(__FILE__), "player_shout.wav"))
  end

  # 本シーンの主描画メソッド
  def play
    if @first
      @timer.start
      # ここでBGMの再生を開始する。
      @bgm.play
      @first = false
    end
    # まずは背景マップの描画を行う（drawメソッドはスクロール実行も兼ねる）
    @map.move
    @map.draw

    # 画面上に描画するべき全ての要素を処理する
    draw_items.each do |char|
      char.move  # キャラクタに移動を命じる
      char.draw  # キャラクタの画像を画面に表示させる
    end

    # Xキーが押下されたらプレイヤーは弾を発射する
    if Input.keyPush?(K_X)
      return if @player.hp == 0
      @shouts << @player.shout#<<はpush、配列にたくさんのオブジェクトを突っ込む、全部オブジェクトだからできる
      @sound.play
    end
    
    #Boxをランダムに作成
    #乱数で１が出た場合もしくは@boxesの配列の中身がなくなったら一個boxオブジェクトを生成
    if(rand(200) == 1) || @boxes.size == 0
      box = Box.new(self, safe_position(@player.x, 700),
                          safe_position(@player.y, 350))
      @boxes << box
    end

    #RedBullをランダムに出現
    if(rand(800) == 1)
      @redbulls << Redbull.new(self, rand(700)+50, rand(500)+50)
    end
    check_collision # 当たり判定の一括処理
    check_clear     # ゲームクリア条件の判定処理
    check_badend    # ゲームオーバー条件の判定処理
  end

  private

  # プレイヤー座標と重ならない安全な座標を返す
  def safe_position(player_postion, limit)
    loop do
      rand_num = rand(limit) + 50
      if rand_num < (player_postion - 40) || rand_num > (player_postion + 40)
        return rand_num
      end
    end
  end

  # 画面上に描画するべき全ての要素を1つの配列として返す
  def draw_items
    return [@player] + @boxes + @shouts + @effects + @memory_pieces + [@timer] + [@hpgage] + @redbulls + @got_pieces
  end

  # 画面上の全ての要素（キャラクタ）に対して、当たり判定を行う
  def check_collision
    collisions = draw_items.map{|c| c.collision }.compact
    Collision.check(collisions, collisions)
  end

  # ゲームのクリア条件を判定する
  # ※ ここでは単にリターンキーの押下でゲーム終了としている
  def check_clear
    if Input.keyPush?(K_RETURN) || piece_box.complate?(:ruby) || piece_box.complate?(:perl)
      if piece_box.complate?(:ruby) || Input.keyPush?(K_RETURN)
        Ending.image_type = :Ruby
        Ending.staff_roll_type = :A  if @got_pieces.size <= 4     #クラスメソッド
        Ending.staff_roll_type = :B  if ((4 < @got_pieces.size)&&(@got_pieces.size <= 6))
        Ending.staff_roll_type = :C  if 6 < @got_pieces.size
      elsif piece_box.complate?(:perl)
        Ending.image_type = :Perl
        Ending.staff_roll_type = :D  if @got_pieces.size <= 4     #クラスメソッド
        Ending.staff_roll_type = :E  if ((4 < @got_pieces.size)&&(@got_pieces.size <= 6))
        Ending.staff_roll_type = :F  if 6 < @got_pieces.size
      end
      # BGMを止める。
      @bgm.stop
      Scene.set_current_scene(:ending)
    end
  end
 
  def check_badend
    if Input.keyPush?(K_J)
     #  シーンを切り替え、バッドエンディングシーンへ遷移
     # BGMを止める
     @bgm.stop
     Scene.set_current_scene(:badend)
    end
  end
end
