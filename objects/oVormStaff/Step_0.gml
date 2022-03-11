
switch (nextAttack) {
	case("Laser"):
		if attackFrame < 126+60 and attackFrame > 60 {
			sprite_index = sVormStaffBeam
		} else if attackFrame > 126+60 attackFrame = 0; else {
			sprite_index = sVormStaff
			image_angle = point_direction(x, y, oPlayer.x, oPlayer.y-40)-90

	
		}
		if attackFrame == 126+35 {
			instance_create_depth(x,y,1,oVBeam)
		}
		attackFrame += 1
		break
	case("Burst"):
		if attackFrame < 126+57 and attackFrame > 60 {
			sprite_index = sVormStaffSpin
			image_speed = 1
		} else if attackFrame > 126+57 attackFrame = 0; else {
			sprite_index = sVormStaff
			image_angle = 0
		}
		attackFrame += 1
		break
}