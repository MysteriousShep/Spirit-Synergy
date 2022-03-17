/// @description Insert description here
// You can write your code in this editor

if (abs(oPlayer.x-x) < 50.5) {
	if (oPlayer.x > x) {
		move_left = false
		move_right = false
	}
}


//REMEMBER TO ADD VELOCITY
if (abs(oPlayer.x-x) < 300.5) {
	if (oPlayer.x > x){
		move_left = false
		move_right = true
	}
	else
	{
		move_left = true
		move_right = false
	}
}
else {
	move_left = false
	move_right = false
}

var move = move_right - move_left

hsp += move * walksp

vsp = vsp + grv

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp)
	}	
	hsp = 0
}

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


if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sGoblin
	image_speed = 0
	if (sign(vsp) > 0) image_index = 1 else image_index = 0
}
else
{
	image_speed = 1
	if (hsp == 0)
	{
		sprite_index = sGoblin
	}
	else
	{
		sprite_index = sGoblinRun	
	}
}

if (hsp != 0) image_xscale = sign(hsp)*4

hsp *= 0.95