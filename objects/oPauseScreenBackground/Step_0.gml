
if global.pause {
	if instance_exists(oGameOverAnim) {
		image_alpha = min(1,image_alpha+0.025)
	}
	else if !instance_exists(oWallJumpBossDefeat) {
		image_alpha = min(0.8,image_alpha+0.1)
	} else {
		image_alpha = min(0.2,image_alpha+0.05)
	}
} else {
	image_alpha = max(0,image_alpha-0.1)
}
depth = -400
