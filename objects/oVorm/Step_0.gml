
if not global.pause {
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
			x = irandom_range(0,room_width)
			y = irandom_range(128+sprite_height,room_height-128)
			while not place_meeting(x,y,oWall) {
				y += 1
			}
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
		}
		frame -= 1

	} else {
		image_speed = 0
	}
} else {
	image_speed = 0
}


