# coding: utf-8

class Enemy < Sprite
    def initialize( *arg )
        @vx = rand(-1..1)
        @vy = rand(-1..1)
        super( *arg )
    end

    def update
        self.x += @vx
        self.y += @vy
        if self.x <= 0 ||self.x >= Window.width - self.image.height
            || self.y <= 0 || self.y >= Window.height - self.image.height
            self.x, self.y = rand(640), rand(480)
            @vx = rand(-1..1)
            @vy = rand(-1..1)
        end
    end

    # 他のオブジェクトから衝突された際に呼ばれるメソッド
    def hit(obj)
        self.vanish
    end
end