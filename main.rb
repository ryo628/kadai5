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
font = Font.new(16)

# init player
player = Player.new(400, 400, player_img)

# init enemies
enemies = []
10.times do
 	enemies << Enemy.new(rand(640), rand(480), enemy_img)
end

# main loop
Window.loop do
	# quit for press ESC
 	break if Input.keyPush?(K_ESCAPE)

 	# draw back image
 	Window.draw( 0, 0, back )

 	# enemies
	Sprite.update(enemies)
	Sprite.draw(enemies)

	# player
	player.update
	player.draw

	# shou hp
	Window.draw_font( 10, 10, "HP : #{player.hp}", font )

	# 当たり判定
	Sprite.check(player, enemies)
end