require 'ruby2d'

#set fullscreen: true 
set width: 1024
set height: 768

bgm = Music.new('music/asmodacid.mp3')
bgm.play
tick = 0
imgdir = "smiles/"
images = ["mikulka-smile-cool.png", "mikulka-smile-grin.png", 
          "mikulka-smile-razz.png", "mikulka-smile-sad.png",
          "mikulka-smile-smile.png", "mikulka-smile-surprised.png",
          "mikulka-smile-wink.png"]
faces = []

on :key_down do |k|
  close if k.key == "q"
  clear if k.key == "space"
end

update do
  size = rand(256)
  faces << Image.new("#{imgdir}#{images.sample}",
			x: rand(Window.width - size), 
			y: rand(Window.height - size), 
			width: size, height: size,
			color: "#cc00cc")
  if faces.count > 60
    pew = faces.shift
    pew.remove
  end 
  set background: "random" if tick % 10 == 0 or rand > 0.5
  tick += 1
end
show
