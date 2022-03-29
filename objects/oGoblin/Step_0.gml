
if not global.pause {
	if oPlayer.x < x and abs(oPlayer.x-x) < 250 {
		key_left = false
		key_right = true
	} else if abs(oPlayer.x-x) < 250 {
		key_left = true
		key_right = false
	} else {
		key_left = false
		key_right = false
		if irandom_range(1,480) < abs(attackFrame) and attackFrame < -120 {
			attackFrame = 60
			image_index = 0
			if oPlayer.x < x {
				image_xscale = -4
			} else {
				image_xscale = 4
			}
		}
	}
	if attackFrame = 15 instance_create_depth(x+4*sign(image_xscale),y-28,1,oGoblinArrow)
	if stunFrame > 0 {
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
	stunFrame -= 1
	if stunFrame == 0 {
		x = stunX
		y = stunY
	}
	iframes -= 1
	if stunFrame <= 0 {
		if attackFrame <= 0 enemy_ai(0.5,0.3,21,true,0.8)
		attackFrame -= 1
		image_speed = 1
		if attackFrame >= 0 {
			sprite_index = sGoblinAttack
		} else {
			if (abs(hsp) <= 0.5)
			{
				sprite_index = sGoblinRun
				image_speed = 0
				image_index = 0
			}
			else
			{
				sprite_index = sGoblinRun
				image_speed = walksp/4
			}
			if hsp != 0 image_xscale = sign(hsp)*4
		}
	}
	else {
		image_speed = 0
	}
} else {
	image_speed = 0
}