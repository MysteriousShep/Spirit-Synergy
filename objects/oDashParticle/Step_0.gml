/// @desc Particle Physics
if (not global.pause) {
	image_speed = 1;
	life -= 1;
	if (life <= 0) instance_destroy(self);
	if oPlayer.infiniteSpirit {
		sprite_index = sGhostCircleRed;
	}
	//sprite_index = sFinleyPlaceholder
} else {
	image_speed = 0;
}
