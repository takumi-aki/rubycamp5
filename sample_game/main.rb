require_relative 'u_game'

Ugame.load_scenes
Ugame.init_window(800, 600, "RubyCamp2010 Example")

Scene.set_current_scene(:title)

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Scene.play_scene
  
end
