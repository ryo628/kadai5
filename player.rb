# coding: utf-8

class Player < Sprite
	attr_accessor :hp

 	def initialize( *arg )
 		@hp = 5
		super( *arg )
	end

	def update
		self.x += Input.x
		self.y += Input.y
	end

	def shot( obj )
		@hp -= 1
	end
end