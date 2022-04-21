

if iframes <= 0 and abs(frame) > 60{
	hp -= 1
	image_alpha = 0.75
	iframes = 20
	stunFrame = 3
	if hp <= 0 {
		instance_create_depth(x,y,-401,oWallJumpBossDefeat)
		iframes = 1000
		image_alpha = 1
		stunFrame = -1000
		instance_destroy(oVormStaff)
	}
}




