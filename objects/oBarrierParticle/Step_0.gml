if not global.pause {
	y -= spd
	if not place_meeting(x,y-8,oGhostProjectileBarrier) {
		instance_destroy(self)
	}
}