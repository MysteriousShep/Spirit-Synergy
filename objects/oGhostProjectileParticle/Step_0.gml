/// @desc Particle Physics
if not global.pause {
	image_speed = 1
life -= 1;
depth += 1;
if (life <= 0) instance_destroy(self);
//sprite_index = sFinleyPlaceholder
if oPlayer.infiniteSpirit {
	sprite_index = sGhostProjectileRed
}
} else {
	image_speed = 0
}
