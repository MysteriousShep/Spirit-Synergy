if iframes <= 0 {
	hp -= 2
	image_alpha = 0.5
	iframes = 40
	stunFrame = 180
	if hp <= 0 {
		instance_create_depth(x,y,-401,oWallJumpBossDefeat)
		iframes = 1000
		image_alpha = 1
		stunFrame = -1000
	}
}

