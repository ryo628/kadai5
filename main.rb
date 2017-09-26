# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

# window size
Window.width  = 640
Window.height = 480

# image
player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

back = Image.load("bg_outside_buildings.png")

# font
font32 = Font.new(32)
font64 = Font.new(64)

# init player
player = Player.new(400, 400, player_img)

# init enemies
enemies = []
20.times do
	enemies << Enemy.new(rand(640), rand(480), enemy_img)
end

# main loop
Window.loop do
	# draw back image
	Window.draw( 0, 0, back )

	# quit for press ESC
	break if Input.keyPush?(K_ESCAPE)

	# ending
	if( player.point == 20 )
		Window.draw_font( 50, 150, "game clear", font64 )
	end

	# enemies
	Sprite.update(enemies)
	Sprite.draw(enemies)

	# player
	player.update
	player.draw

	# show point
	Window.draw_font( 10, 10, "Point : #{player.point}", font32, { color: [ 0, 0, 0 ] } )

	# 当たり判定
	Sprite.check(player, enemies)
end
