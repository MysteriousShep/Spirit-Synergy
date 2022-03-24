

if not global.pause {
	vsp += 0.1
	y += vsp

	x += hsp

	image_angle = point_direction(x,y,x+hsp,y+vsp)
	if place_meeting(x,y,oWall) {
		instance_destroy(self)
	}
}