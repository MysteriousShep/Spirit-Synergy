/// @desc Particle Physics
if not global.pause {
	image_speed = 1
	life -= 1;
	depth += 1;
	if (life <= 0) instance_destroy(self);
} else {
	image_speed = 0
}
