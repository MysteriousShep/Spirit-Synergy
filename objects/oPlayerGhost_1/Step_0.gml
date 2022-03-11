if not global.pause {
	if lifetime > 0 {
if place_meeting(x+hsp,y,oGhostProjectileBarrier) or place_meeting(x+hsp,y,oEnemyBarrier) {
	while (!place_meeting(x+sign(hsp),y,oGhostProjectileBarrier) and !place_meeting(x+sign(hsp),y,oEnemyBarrier))
	{
		x = x + sign(hsp);
	}
	hsp *= -1
}
if place_meeting(x,y+vsp,oGhostProjectileBarrier) {
	while (!place_meeting(x,y+sign(vsp),oGhostProjectileBarrier))
	{
		y = y + sign(vsp);
	}
	vsp *= -1
}
if place_meeting(x+hsp,y,oWallJumpBoss) {
	
	with oWallJumpBoss {
		if iframes <= 0 {
			other.hsp *= 0.75
	hp -= 1
	image_alpha = 0.5
	iframes = 20
	stunFrame = 5
	if hp <= 0 {
		instance_destroy(self)
	}
}


		
	}
}
if place_meeting(x,y+vsp,oWallJumpBoss) {
	
	
	with oWallJumpBoss {
			if iframes <= 0 {
				other.vsp *= 0.75
	hp -= 1
	image_alpha = 0.5
	iframes = 20
	stunFrame = 5
	if hp <= 0 {
		instance_destroy(self)
	}
		
	}
	}
}
	}
x += hsp;

y += vsp;

if(is_controller == true)
{
	haxis = gamepad_is_connected(pad_num) ? gamepad_axis_value(pad_num, gp_axisrh) : 0;

	vaxis = gamepad_is_connected(pad_num) ? gamepad_axis_value(pad_num, gp_axisrv) : 0;
}

else
{
	haxis = (keyboard_check(ord("D")) or keyboard_check(vk_right)) - (keyboard_check(ord("A")) or keyboard_check(vk_left))
	vaxis = (keyboard_check(ord("S")) or keyboard_check(vk_down)) - (keyboard_check(ord("W")) or keyboard_check(vk_up))
}

if (haxis != 0 or vaxis != 0) {
	hsp += haxis*1.5
	vsp += vaxis*1.5
}
if lifetime >= 85 {
	vsp += vaxis*0.5
}
if hsp > 0 image_xscale = 4
if hsp < 0 image_xscale = -4
i = 1
repeat(10) {
	var inst = instance_create_depth(x-hsp*i,y-vsp*i,10*i,oGhostProjectileParticle)
	with inst {
		image_index = -1
		life -= 0
		image_xscale = other.image_xscale
	}
	i -= 0.1
}

hsp = hsp * 0.9;

vsp = vsp * 0.9;

lifetime -= 1
if place_meeting(x,y,oWall) {
	lifetime -= 0
	image_alpha = max(image_alpha-0.2,0)
}

if lifetime <= 0 {
	hsp = (oPlayer.x-x)/100
	vsp = (oPlayer.y-y)/100
	speed += 1
	direction = point_direction(x,y,oPlayer.x,oPlayer.y-40)
	if distance_to_object(oPlayer) < 40 or speed > 40 {
		instance_destroy(self)
	}
}
} else {
	image_speed = 0
	x = xprevious
	y = yprevious
	speed = 0
}