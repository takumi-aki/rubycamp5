# coding: Windows-31J

class Map
  MAP_TILE_IMAGE = File.join(File.dirname(__FILE__), "images", "maptile.png")
  CHIP_SIZE = 32
  SCREEN_WIDTH = 25
  SCREEN_HEIGHT = 19
  attr_accessor :delete

  def initialize(player)
    @player = player
    @map_data = map_load("stage1.dat")
    @y = 14
    @count = CHIP_SIZE
    @delete = false
    temp = Image.load(MAP_TILE_IMAGE)
    chip_width  = temp.width / CHIP_SIZE
    chip_height = temp.height / CHIP_SIZE
    @map_chips = Image.loadToArray(MAP_TILE_IMAGE, chip_width, chip_height)
  end

  def draw
    update
    x = (@player.x / 5)
    Window.drawTile(0, 0, @map_data, @map_chips,
                    x, @y * CHIP_SIZE + @count,
                    SCREEN_WIDTH, SCREEN_HEIGHT, 0)
  end


  private

  def update
    @count -= 1

    if @count < 0
      @count += 32
      @y -= 1
      @y += @map_data.size if @y < 0
    end
  end

  def map_load(dat_file)
    map_file = File.join(File.dirname(__FILE__), "map_data", dat_file)
    dat = []
    File.open(map_file) do |f|
      f.each do |line|
        dat << line.chomp.split(/\s*,\s*/).map{|chip| chip.to_i}
      end
    end
    return dat
  end
end
