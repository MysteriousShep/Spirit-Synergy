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
}
x += hsp;

y += vsp;


haxis = (oPlayer.x > x) - (oPlayer.x < x) 
vaxis = (oPlayer.y > y) - (oPlayer.y < y)

/*
if (haxis != 0 or vaxis != 0) {
	hsp += haxis*0.25
	vsp += vaxis*0.25
}
*/
if sign(vaxis) != sign(vsp) {
	vsp += vaxis*0.05
} else {
	vsp += vaxis*0.2
}
if sign(haxis) != sign(hsp) {
	hsp += haxis*0.05
} else {
	hsp += haxis*0.2
}
if hsp > 0 image_xscale = 4
if hsp < 0 image_xscale = -4
i = 1
repeat(10) {
	var inst = instance_create_depth(x-hsp*i,y-vsp*i,10*i,oVormGhostParticle)
	with inst {
		image_index = -1
		life -= 0
		image_xscale = other.image_xscale
	}
	i -= 0.1
}

hsp = hsp * 0.97;

vsp = vsp * 0.97;

lifetime -= 1

if lifetime <= 0 {
	hsp = (oVorm.x-x)/100
	vsp = (oVorm.y-y)/100
	speed += 1
	direction = point_direction(x,y,oVorm.x,oVorm.y)
	if distance_to_object(oVorm) < 40 or speed > 40 {
		instance_destroy(self)
	}
}
} else {
	image_speed = 0
	x = xprevious
	y = yprevious
	speed = 0
}