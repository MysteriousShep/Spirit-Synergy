
if not global.pause {
	image_speed = 1
	switch(state) {
		case("free"):
			speed = distance_to_point(targetX,targetY)/20
			if distance_to_point(targetX,targetY) < 40 and frame < -180 {
				frame = 100
				speed = 0
				attacks = ["focus","trishot","burst","screenwipe"]
				state = attacks[irandom_range(0,3)]
				targetX = max(0,min(room_width,irandom_range(oPlayer.x-250,oPlayer.x+250)))
				targetY = max(0,min(room_height,irandom_range(oPlayer.y-200,oPlayer.y+50)))
			}
			direction = point_direction(x,y,targetX,targetY)
			image_angle = image_angle*0.8
			if abs(image_angle) < 2 { 
				image_angle = 0
			}
			sprite_index = sVormStaff
			image_index = 0
			break;
		case("focus"):
			if frame >= 60 {
				target_dir = point_direction(x,y,oPlayer.x,oPlayer.y-40)-90
				image_angle -= (image_angle-target_dir)*0.2
			} else if frame % 20 = 0 {
				var projectile = instance_create_layer(x,y,"instances",oVBlast)
				with projectile {
					image_angle = other.image_angle+90
					direction = other.image_angle+90
				}
				image_angle = point_direction(x,y,oPlayer.x,oPlayer.y-40)-90
			}
			sprite_index = sVormStaffBeam
			if frame < 0 {
				frame = 1
				state = "free"
			}
			break;
		case("trishot"):
			if frame >= 60 {
				target_dir = point_direction(x,y,oPlayer.x,oPlayer.y-40)-90
				image_angle -= (image_angle-target_dir)*0.2
			} else if frame = 40 {
				var projectile = instance_create_layer(x,y,"instances",oVBlast)
				with projectile {
					image_angle = other.image_angle+90
					direction = other.image_angle+90
				}
				var projectile = instance_create_layer(x,y,"instances",oVBlast)
				with projectile {
					image_angle = other.image_angle+60
					direction = other.image_angle+60
				}
				var projectile = instance_create_layer(x,y,"instances",oVBlast)
				with projectile {
					image_angle = other.image_angle+120
					direction = other.image_angle+120
				}
				image_angle = point_direction(x,y,oPlayer.x,oPlayer.y-40)-90
			}
			sprite_index = sVormStaffTrishot
			if frame < 0 {
				frame = 1
				state = "free"
			}
			break;
		case("burst"):
			sprite_index = sVormStaffSpin
			if frame <= 72 and frame % 3 = 1 {
				var projectile = instance_create_layer(x,y,"instances",oVBlast)
				with projectile {
					image_angle = other.next_angle
					direction = other.next_angle
				}
				next_angle -= irandom_range(1,360)
			}
			if frame < 0 {
				frame = 1
				state = "free"
			}
			break;
		case("screenwipe"):
			if frame >= 50 {
				target_dir = 0
				image_angle -= (image_angle-target_dir)*0.2
			} else {
				var projectile = instance_create_layer(x,y,"instances",oVBlast)
				with projectile {
					image_angle = other.image_angle+90
					direction = other.image_angle+90
				}
				image_angle -= 1
			}
			sprite_index = sVormStaffBeam
			if frame < -310 {
				frame = 1
				state = "free"
			}
			break;
	}
	frame -= 1
} else {
	image_speed = 0
	speed = 0
}





