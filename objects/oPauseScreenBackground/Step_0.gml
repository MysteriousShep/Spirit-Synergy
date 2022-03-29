
if global.pause {
	if instance_exists(oGameOverAnim) {
		image_alpha = min(1,image_alpha+0.025)
	}
	else {
		image_alpha = min(0.8,image_alpha+0.1)
	}
} else {
	image_alpha = 0
}
depth = -400
