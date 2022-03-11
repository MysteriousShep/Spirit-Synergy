if not global.pause {
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
switch(state) {
	case("free"):
		key_left = false
		key_right = false
		key_jump = false
		dash = false
		attack = false
		
		break
	case("dash"):
		if image_index > 10 and image_index < 17 {
			key_left = true
		} else {
			key_left = false
		}
		key_right = false
		key_jump = false
		dash = false
		attack = false
		break
	case("jump1"):
		if x > 190 {
			key_left = true
		} else {
			key_left = false
		}
		key_right = false
		if (frame > 40) key_jump = true;
		else key_jump = false
		dash = false
		attack = false
		break
	case("jump2"):
		if x < 544 {
			key_right = true
		} else {
			key_right = false
		}
		key_left = false
		if (frame > 40) key_jump = true;
		else key_jump = false
		dash = false
		attack = false
		break
	case("jump3"):
		if x < 768+32 {
			key_right = true
		} else {
			key_right = false
		}
		key_left = false
		if (frame > 40) key_jump = true;
		else key_jump = false
		dash = false
		attack = false
		break
	case("jump4"):
		if x < 1088 {
			key_right = true
		} else {
			key_right = false
		}
		key_left = false
		if (frame > 40) key_jump = true;
		else key_jump = false
		dash = false
		attack = false
		break
	case("drop"):
		if x > 960 {
			key_left = true
		} else {
			key_left = false
		}
		key_right = false
		if (frame > 40) key_jump = true;
		else key_jump = false
		dash = false
		attack = false
		break
	case("wallJump"):
		if x > 833 and y > 384 {
			key_left = true
		} else {
			key_left = false
		}
		if x < 1088 and y < 384 {
			key_right = true
		} else {
			key_right = false
		}
		if (frame > 50 or (cling and frame < 40)) key_jump = true;
		else key_jump = false
		dash = false
		attack = false
		break
	case("attack"):
		key_left = false
		key_right = false
		key_jump = false
		dash = false
		attack = false
		if image_index == 22 and not instance_exists(oWallJumpBossOrb) {
			instance_create_depth(x,y-52,-1,oWallJumpBossOrb)
		}
		break
}

//Initiate Dash
if (dash) {
	frame = 80
	image_index = 0
	state = "dash"
}


//Calculate movement
var move = key_right - key_left
if (state == "dash") move *= 4
if (state == "jump2" or state == "jump3" or state == "jump4") move *= 1.25
if (state == "drop") move *= 0.75
if wallJumpCooldown <= 0 {
	hsp = move * walksp
}
vsp = vsp + grv

if (place_meeting(x,y+1,oWall)) and (key_jump)
{
	if (state == "jump2") vsp = -12 else if (state == "jump3") vsp = -6 else if (state == "jump4") vsp = -7 else if (state == "drop") vsp = -5 else if (state == "wallJump") vsp = -11 else vsp = -10
}



//Horizontal Collision
if (place_meeting(x+hsp,y,oWall)) 
{
	
	repeat(8)
	{
		if (place_meeting(x+hsp, y, oWall)) y -= 1;
	}
	
	if (place_meeting(x+hsp, y, oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		if (not hasWallJump) hsp = 0;
		y += 8
		if hasWallJump {
			if (place_meeting(x+hsp,y-64,oWall)) and collision_point(x+hsp+sign(hsp)*14,y,oWall,false,true) {
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
x = x + hsp

//Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp)
	}	
	vsp = 0
}

y = y + vsp

//Animation
if (!place_meeting(x,y+1,oWall))
{
	switch(state) {
		case("free"):
			if cling {
				sprite_index = sTregoriousAir
				image_speed = 0
			} else {
				sprite_index = sTregoriousAir
				image_speed = 0
				if (sign(vsp) > 0) image_index = 1 else image_index = 0
			}
			break
		case("dash"):
			sprite_index = sTregoriousDash
			image_speed = 1;
			break
		case("jump1"):
			sprite_index = sTregoriousAir
			image_speed = 0
			if (sign(vsp) > 0) image_index = 1 else image_index = 0
			break
		case("jump2"):
			sprite_index = sTregoriousAir
			image_speed = 0
			if (sign(vsp) > 0) image_index = 1 else image_index = 0
			break
		case("jump3"):
			sprite_index = sTregoriousAir
			image_speed = 0
			if (sign(vsp) > 0) image_index = 1 else image_index = 0
			break
		case("jump4"):
			sprite_index = sTregoriousAir
			image_speed = 0
			if (sign(vsp) > 0) image_index = 1 else image_index = 0
			break
		case("drop"):
			sprite_index = sTregoriousAir
			image_speed = 0
			if (sign(vsp) > 0) image_index = 1 else image_index = 0
			break
		case("wallJump"):
			if cling {
				sprite_index = sTregoriousAir
				image_speed = 0
			} else {
				sprite_index = sTregoriousAir
				image_speed = 0
				if (sign(vsp) > 0) image_index = 1 else image_index = 0
			}
			break
		case("attack"):
			sprite_index = sTregoriousAttack
			image_speed = 1
			if oPlayer.x < x {
				image_xscale = -4
			} else {
				image_xscale = 4
			}
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
				sprite_index = sTregorious
				image_speed = 0
				image_index = 0
			}
			else
			{
				sprite_index = sTregorious
			}
			break
		case("dash"):
			sprite_index = sTregoriousDash
			image_speed = 1
			break
		case("jump1"):
			sprite_index = sTregorious
			image_speed = 1
			break
		case("jump2"):
			sprite_index = sTregorious
			image_speed = 1
			break
		case("jump3"):
			sprite_index = sTregorious
			image_speed = 1
			break
		case("jump4"):
			sprite_index = sTregorious
			image_speed = 1
			break
		case("drop"):
			sprite_index = sTregorious
			image_speed = 1
			break
		case("wallJump"):
			sprite_index = sTregorious
			image_speed = 1
			break
		case("attack"):
			sprite_index = sTregoriousAttack
			image_speed = 1
			if oPlayer.x < x {
				image_xscale = -4
			} else {
				image_xscale = 4
			}
			break
	}
}
frame -= 1
if (frame <= 0) {
	
	switch(state) {
		case("free"):
			switch(nextAttack) {
				case("dash"):
					dash = true
					image_xscale = -4
					state = "dash"
					frame = 80
					image_index = 0
					x = 960
					
					break
				case("jump1"):
					state = "jump1"
					frame = 60
					break
				case("jump2"):
					state = "jump2"
					frame = 60
					break
				case("jump3"):
					state = "jump3"
					frame = 55
					break
				case("jump4"):
					state = "jump4"
					frame = 60
					break
				case("drop"):
					state = "drop"
					frame = 60
					break
				case("wallJump"):
					state = "wallJump"
					frame = 80
					break
				case("attack"):
					state = "attack"
					frame = 25*60/15
					image_index = 0
					break
			}
			break
		case("dash"):
			prevAttack = state
			state = "free"
			frame = 20
			nextAttack = "jump1"
			x = 423.50
			break
		case("jump1"):
			prevAttack = state
			state = "free"
			frame = 80
			randomize()
			if irandom_range(0,1) == 0 {
				nextAttack = "jump2"
			} else {
				nextAttack = "attack"
			}
			image_xscale = 4
			break
		case("jump2"):
			state = "free"
			frame = 0
			nextAttack = "jump3"
			break
		case("jump3"):
			state = "free"
			frame = 0
			nextAttack = "jump4"
			break
		case("jump4"):
			prevAttack = state
			state = "free"
			frame = 120
			randomize()
			if (irandom_range(0,1) = 0) {
				nextAttack = "drop"
			}
			else {
				nextAttack = "attack"
			}
			break
		case("drop"):
			prevAttack = state
			state = "free"
			frame = 60
			randomize()
			if (irandom_range(0,4) = 0) {
				nextAttack = "wallJump"
			}
			else if irandom_range(0,1) = 0 {
				nextAttack = "attack"
			} else {
				nextAttack = "dash"
			}
			break
		case("wallJump"):
			prevAttack = state
			state = "free"
			frame = 60
			
			nextAttack = "attack"
			break
		case ("attack"):
			state = "free"
			frame = 60
			if (prevAttack = "jump1") {
				nextAttack = "jump2"
			} else if (prevAttack = "jump4" or prevAttack = "wallJump") {
				nextAttack = "drop"
			} else if (prevAttack = "drop") {
				nextAttack = "dash"
			}
			
			break
	}
	
}
if (hsp != 0) image_xscale = sign(hsp)*4
}
else {
	image_speed = 0
}
} else {
	image_speed = 0
}