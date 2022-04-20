if not global.pause {

speed = spd;

image_speed = 1
if (x > room_width or x < 0 or y < 0 or y > room_height) {
	instance_destroy(self)
}
}
else {
	image_speed = 0
	x = xprevious
	y = yprevious
	speed = 0
}