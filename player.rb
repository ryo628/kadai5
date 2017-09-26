# coding: utf-8

class Player < Sprite
	attr_accessor :point

	def initialize( *arg )
		@point = 0
		super( *arg )
	end

	def update
		self.x += 2*Input.x
		self.y += 2*Input.y
	end

	def shot( obj )
		@point += 1
	end
end