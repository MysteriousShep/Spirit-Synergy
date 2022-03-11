if not global.pause {
	image_speed = 1
if not (oPlayer.state = "shieldBreak") {
	instance_destroy(self)
}
x = oPlayer.x
y = oPlayer.y
image_xscale = oPlayer.image_xscale
} else {
	image_speed = 0
}