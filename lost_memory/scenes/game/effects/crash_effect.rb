class CrashEffect < EffectBase
  def initialize(director, x, y, opts = {})
    super
    image_file = File.join(File.dirname(__FILE__), "..", "images", "effect.png")
    chip_size_width = 150
    chip_size_height = 100
    temp = Image.load(image_file)
    chip_width  = temp.width / chip_size_width
    chip_height = temp.height / chip_size_height
    @images = Image.loadToArray(image_file, chip_width, chip_height)
    @images = @images.map{|i| i.setColorKey([0, 0, 0]) }
    @counter = 0.0

    @image = @images[@counter.to_i]
  end

  def move
    if @counter.to_i >= (@images.size - 1)
      remove
    end
    @image = @images[@counter.to_i]
    @counter += 0.5
  end
end
