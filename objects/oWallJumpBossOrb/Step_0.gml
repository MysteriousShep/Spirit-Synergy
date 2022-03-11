if not global.pause {
spd += 0.2
speed = spd;

image_speed = 0
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