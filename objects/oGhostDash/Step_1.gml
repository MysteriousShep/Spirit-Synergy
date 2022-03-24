/// @desc Dash Physics
if not global.pause {
if instance_exists(creator) and creator.is_controller {
	up = gamepad_axis_value(creator.pad_num,gp_axislv) < 0 or gamepad_button_check(creator.pad_num,gp_padu)
	down = gamepad_axis_value(creator.pad_num,gp_axislv) > 0 or gamepad_button_check(creator.pad_num,gp_padd)
} else {
	up = keyboard_check(ord("W")) or keyboard_check(vk_up)
	down = keyboard_check(ord("S")) or keyboard_check(vk_down)
}
vspd += down*4 - up*4

if (place_meeting(x,y+vspd,oWall) or place_meeting(x,y+vspd,oEnemyBarrier))
{
	while (!place_meeting(x,y+sign(vspd),oWall) and !place_meeting(x,y+sign(vspd),oEnemyBarrier))
	{
		y = y + sign(vspd)
	}	
	vspd = 0
}
y += vspd;

if (place_meeting(x+hspd,y,oWall) or place_meeting(x+hspd,y,oEnemyBarrier) or place_meeting(x+hspd,y,oTargetDoor))
{
	while (!place_meeting(x+sign(hspd),y,oWall) and !place_meeting(x+sign(hspd),y,oEnemyBarrier) and !place_meeting(x+sign(hspd),y,oTargetDoor))
	{
		x = x + sign(hspd)
	}	
	x = x - sign(hspd)
	hspd = 0
	
}
x += hspd

i = 1
repeat(10) {
	instance_create_depth(x-hspd*i,y-40-vspd*i,10-10*i+lifetime,oDashParticle)
	i -= 0.1
}


if (lifetime <= 0) {
	creator.x = x
	creator.y = y
	creator.vsp = vspd*0.1
	creator.hsp = 0
	instance_destroy(self)
}
lifetime -= 1
} else {
	image_speed = 0
}
