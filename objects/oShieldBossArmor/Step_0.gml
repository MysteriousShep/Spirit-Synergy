
if not global.pause {
	if oPlayer.x < x {
		if abs(oPlayer.x-x) < 150 {
			key_left = false
			key_right = true
		} else if abs(oPlayer.x-x) > 275 {
			key_left = true
			key_right = false
		} else {
			key_left = false
			key_right = false
			if attackFrame < -120 {
				attackFrame = 90
				image_index = 0
				if oPlayer.x < x {
					image_xscale = -4
				} else {
					image_xscale = 4
				}
			}
		}
	} else {
		if abs(oPlayer.x-x) < 150 {
			key_left = true
			key_right = false
		} else if abs(oPlayer.x-x) > 275 {
			key_left = false
			key_right = true
		} else {
			key_left = false
			key_right = false
			if stunFrame <= 0 {
				if attackFrame < -120 {
					attackFrame = 90
					image_index = 0
					if oPlayer.x < x {
						image_xscale = -4
					} else {
						image_xscale = 4
					}
				}
			}
		}
	}
	if attackFrame = 90 and !instance_exists(oShieldBossArmAttack) instance_create_depth(x-4*9*sign(image_xscale),y-23*4,1,oShieldBossArmAttack)
	

	
	stunFrame -= 1
	
	iframes -= 1
	if stunFrame <= 0 {
		if attackFrame <= 0 enemy_ai(walksp,0.3,21)
		attackFrame -= 1
		image_speed = 1
		if attackFrame >= 0 {
			sprite_index = sShieldBossAttack
		} else {
			if (abs(hsp) <= 0.5)
			{
				sprite_index = sShieldBossRun
				image_speed = 0
				image_index = 0
			}
			else
			{
				sprite_index = sShieldBossRun
				image_speed = walksp/4*sign(hsp)*sign(image_xscale)
			}
			if hsp != 0 {
				if oPlayer.x < x {
					image_xscale = -4
				} else {
					image_xscale = 4
				}
			}
		}
	}
	else {
		if stunFrame <= 60 {
			image_speed = 1
		} else {
			image_speed = 0
			image_index = 0
		}
		sprite_index = sShieldBossInanimate
		if image_index >= 9 {
			image_index = 9
		}
	}
	if !instance_exists(oShieldBoss) {
		stunFrame = 62
	}
} else {
	image_speed = 0
}