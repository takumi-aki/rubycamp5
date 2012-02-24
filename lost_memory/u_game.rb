require 'dxruby'
require 'dxrubyex'

UGAME_LIB = 'lib'
UGAME_SCENES = 'scenes'

require_relative File.join(UGAME_LIB, 'scene')
require_relative File.join(UGAME_LIB, 'text')
require_relative File.join(UGAME_LIB, 'scroll_text')

module Ugame
  module_function

	# デフォルト値 scenesフォルダの中のファイルを順番に読み込む
  def load_scenes(path = UGAME_SCENES, scene_opts = {})
    base_path = File.join(File.dirname(__FILE__), path)
    Dir.foreach(base_path) do |item|
      next if item == '.' || item == '..' || !File.directory?(File.join(base_path, item))

      file = File.join(base_path, item, "#{item}.rb")
      require file
      base_name  = File.basename(file, ".*")
      class_name = base_name.split("_").map{|part| part.downcase.capitalize}.join("").to_sym

      if scene_opts[class_name]
        scene_obj  = Object.const_get(class_name).new(scene_opts[class_name])
      else
        scene_obj  = Object.const_get(class_name).new
      end
      Scene.add_scene(scene_obj,  base_name.to_sym)
    end
  end

  def init_window(width = 800, height = 600, caption = "")
    Window.caption = caption
    Window.width   = width
    Window.height  = height
  end
end