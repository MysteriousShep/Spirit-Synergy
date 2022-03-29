if not global.pause and not framesUntilControlable > 0 {
iframes -= 1
image_alpha = max(0,min(1,1-iframes/30))
if room  != Room_GameOver {
//Get player input, unless dashing
switch(state) {
	case("free"):
		if is_controller {
			key_left = gamepad_axis_value(pad_num,gp_axislh) < 0 or gamepad_button_check(pad_num,gp_padl)
			key_right = gamepad_axis_value(pad_num,gp_axislh) > 0 or gamepad_button_check(pad_num,gp_padr)
			key_jump = gamepad_button_check(pad_num,gp_face2) or gamepad_button_check(pad_num,gp_face3) or gamepad_button_check(pad_num,gp_shoulderlb)
			dash = gamepad_button_check_pressed(pad_num,gp_face1) or gamepad_button_check_pressed(pad_num,gp_face4) or gamepad_button_check_pressed(pad_num,gp_shoulderl)
			attack = gamepad_button_check_pressed(pad_num,gp_shoulderr)
			projectile =  gamepad_button_check_pressed(pad_num,gp_shoulderrb)
			key_down = gamepad_axis_value(pad_num,gp_axislv) > 0
		}
		break
	case("dash"):
		key_left = false
		key_right = false
		key_jump = false
		dash = false
		attack = false
		projectile = false
		break
	case("attack"):
		if (!place_meeting(x,y+1,oWall)) {
			if is_controller {
				key_left = gamepad_axis_value(pad_num,gp_axislh) < 0 or gamepad_button_check(pad_num,gp_padl)
				key_right = gamepad_axis_value(pad_num,gp_axislh) > 0 or gamepad_button_check(pad_num,gp_padr)
			}
		} else {
			key_left = false
			key_right = false
		}
		key_jump = false
		if is_controller
		{
			dash = gamepad_button_check_pressed(pad_num,gp_face1) or gamepad_button_check(pad_num,gp_face4)
			projectile = false
		}
		attack = false
		if image_index = 3 and not instance_exists(oPlayerGhost) {
			var projinst = instance_create_layer(x,y-40,"Instances",oPlayerGhost)
			with projinst {
				hsp += other.image_xscale*2
				if other.is_controller {
					pad_num = other.pad_num
				}
				is_controller = other.is_controller
				if is_controller {
					player[pad_num] = self
				}
			}
		}
		
		break
	case("shieldBreak"):
		
		key_left = false
		key_right = false
		key_jump = false
		dash = false
		projectile = false
		attack = false
		
		break
}

//Initiate Dash
if (dash and not instance_exists(oPlayerGhost) and hasDash) {
	if (spirit-7>=0) {
		var dashinst = instance_create_layer(x,y,"Instances",oGhostDash)
		with dashinst {
			if other.key_right {
				hspd = 4*9
			} else if other.key_left {
				hspd = -4*9
			} else {
				hspd = other.image_xscale*9*0
			}
			image_xscale = other.image_xscale
			creator = other
		}
		frame = 13
		spirit -= 7
		state = "dash"
	}
}

if (projectile and not instance_exists(oPlayerGhost) and hasProjectile) {
	if (spirit>0) {
		state = "attack"
		frame = 24
		image_index = 0
	}
} else if hasProjectile and projectile {
	oPlayerGhost.lifetime = 0
}
if instance_exists(oPlayerGhost) {
	if spirit > 0 and oPlayerGhost.lifetime > 0 {
		spirit -= 0.125
	} else {
		oPlayerGhost.lifetime = -1
	}
}
if (attack and place_meeting(x,y+1,oWall) and not instance_exists(oPlayerGhost) and hasShieldBreak) {
	if (spirit-14>=0) {
		spirit -= 14
		var attacinst = instance_create_depth(x,y,-1,oPlayerHitbox)
		with attacinst {
			image_speed = 1
			image_xscale = other.image_xscale
			image_yscale = other.image_yscale
			image_alpha = 0
		}
		frame = 64
		image_index = 0
		state = "shieldBreak"
	}
}

//Calculate movement
var move = key_right - key_left
	if wallJumpCooldown <= 0 {
		hsp = move * walksp
	}
	if state != "dash" {
		vsp = vsp + grv
	}
	if key_down {
		vsp += grv*2
	}

	if (place_meeting(x,y+1,oWall)) and (key_jump)
	{
		vsp = -9
	}



	//Horizontal Collision
	
	if not noClip {
	if (place_meeting(x+hsp,y,oWall) or place_meeting(x+hsp,y,oEnemyBarrier) or place_meeting(x+hsp,y,oTargetDoor)) 
	{
	
		repeat(8)
		{
			if (place_meeting(x+hsp, y, oWall) or place_meeting(x+hsp,y,oEnemyBarrier) or place_meeting(x+hsp,y,oTargetDoor)) y -= 1;
		}
	
		if (place_meeting(x+hsp, y, oWall) or place_meeting(x+hsp,y,oEnemyBarrier) or place_meeting(x+hsp,y,oTargetDoor))
		{
			while (!place_meeting(x+sign(hsp),y,oWall) and !place_meeting(x+sign(hsp),y,oEnemyBarrier) and !place_meeting(x+sign(hsp),y,oTargetDoor))
			{
				x = x + sign(hsp);
			}
			if (not hasWallJump) hsp = 0;
			y += 8
			if hasWallJump {
				if (place_meeting(x+hsp,y-64,oWall)) and collision_point(x+hsp+sign(hsp)*14,y,oWall,false,true) and (state == "free" or state == "dash") {
					vsp = 0
					if not place_meeting(x,y+1,oWall)  {
						cling = true
						image_xscale = -sign(hsp)*4
					} else {
						cling = false
					}
					if key_jump and wallJumpCooldown <= 0 {
						vsp = -10
						if not place_meeting(x,y+1,oWall) { 
							hsp = sign(hsp)*-walksp
						} else {
							hsp = 0
						}
						wallJumpCooldown = 20
						cling = false
					} else {
						hsp = 0
					}
				
				} else {
					hsp = 0
					cling = false
				}
			
			}
		}
	} else {
		cling = false
	}
	wallJumpCooldown -= 1
	}
	x = x + hsp

	//Vertical Collision
	if not noClip or vsp >= 0 and not (key_down and godMode) {
		if (place_meeting(x,y+vsp,oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp)
			}	
			vsp = 0
		}
	}

	y = y + vsp

if state = "dash" and instance_exists(oGhostDash) {
	x = oGhostDash.x
	y = oGhostDash.y
}

//Animation
if (!place_meeting(x,y+1,oWall))
{
	switch(state) {
		case("free"):
			if cling {
				sprite_index = animations.cling
				image_speed = 1
			} else {
				sprite_index = animations.air
				image_speed = 0
				if (sign(vsp) > 0) image_index = 1 else image_index = 0
			}
			break
		case("dash"):
			if frame >= 10 {
				sprite_index = animations.dash
				image_speed = 0
				image_index = 0
				visible = false
			} else {
				sprite_index = animations.dash
				image_speed = 1
				visible = true
			}
			break
		case("attack"):
			if (sign(vsp) > 0) sprite_index = animations.airAttackDown else sprite_index = animations.airAttackUp
			image_speed = 1
			break
	}
}
else
{
	switch(state) {
		case("free"):
			image_speed = 1
			if (hsp == 0)
			{
				sprite_index = animations.run
				image_speed = 0
				image_index = 0
			}
			else
			{
				sprite_index = animations.run
				image_speed = walksp/4
			}
			break
		case("dash"):
			if frame >= 10 {
				sprite_index = animations.dash
				image_speed = 0
				image_index = 0
				visible = false
			} else {
				sprite_index = animations.dash
				image_speed = 1
				visible = true
			}
			break
		case("attack"):
			sprite_index = animations.attack
			image_speed = 1
			break
		case("shieldBreak"):
			sprite_index = animations.shieldBreak
			image_speed = 1
			break
	}
}
frame -= 1
if (frame <= 0) {
	switch(state) {
		case("free"):
			break
		case("dash"):
			state = "free"
			visible = true
			break
		case("attack"):
			state = "free"
			break
		case("shieldBreak"):
			state = "free"
			break
	}
}
} else {
	image_speed = 0
	image_blend = c_black
	if is_controller {
		if gamepad_button_check_pressed(pad_num, gp_face3) {
			game_restart()
		}
	}
}
if (hsp != 0) image_xscale = sign(hsp)*4

if not infiniteSpirit {
	if (spirit<21 and not instance_exists(oPlayerGhost) and state == "free") spirit += 0.1
} else {
	spirit = 21
}

// SET TO PLACEHOLDER
/*
if state = "free" {
	sprite_index = sFinleyPlaceholder
} else if state = "attack" or state = "attack2" {
	sprite_index = sFinleyAttackPlaceholder
}
*/
} else {
	image_speed = 0
	framesUntilControlable -= 1
}