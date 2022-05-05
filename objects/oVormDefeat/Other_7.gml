

instance_destroy(self)
instance_destroy(oVorm)
instance_destroy(oVormGhost)
instance_destroy(oVormStaff)
instance_destroy(oVBlast)
instance_destroy(oVormGhostParticle)
global.pause = false
with oPlayer {
	alarm_set(0,60)
}
oPlayer.framesUntilControlable = 60
