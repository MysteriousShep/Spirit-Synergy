
if not global.pause {
	if framesUntilControlable < 0 {
		if stunFrame > 0 and stunFrame > -998 {
			x = stunX
			y = stunY
			x += random_range(-10,10)
			y += random_range(-3,3)
		} else {
			stunX = x
			stunY = y
		}

		if iframes <= 0 {
			image_alpha = 1
		}
		if stunFrame > -998 {
			stunFrame -= 1
		}
		if stunFrame == 0 {
			x = stunX
			y = stunY
		}
		iframes -= 1


		if stunFrame <= 0 and stunFrame > -999{
			if frame = 0 {
				x = irandom_range(256,room_width-256)
				y = irandom_range(256+sprite_height,room_height-256)
				while place_meeting(x,y,oWall) {
					y -= 1
				}
				while not place_meeting(x,y,oWall) {
					y += 1
				}
				y -= 1
			}
			if frame >= 0 {
				image_speed = 1
			} else {
				image_speed = -1
			}
			if frame > -60 {
				sprite_index = sVormTele
			} else {
				sprite_index = sVorm
				image_index = 0
			}
			if frame < -300 {
				frame = 60
				cycle += 1
				if cycle > 2 {
					instance_create_layer(x,y,"instances",oVormGhost)
					cycle = 0
				}
			}
			frame -= 1
		
		
		} else {
			image_speed = 0
		}
	} else {
		framesUntilControlable -= 1
		if framesUntilControlable <= 60 {
			sprite_index = sVormBattleStart
			image_speed = 1
			if image_index = 12 and not instance_exists(oMagicShader) {
				instance_create_layer(0,0,"instances_1",oMagicShader)
			}
		} else {
			image_index = 0
		}
	}
} else {
	image_speed = 0
}


