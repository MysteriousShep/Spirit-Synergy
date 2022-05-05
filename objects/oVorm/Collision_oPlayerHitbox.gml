

if iframes <= 0 and abs(frame) > 60{
	hp -= 2
	image_alpha = 0.75
	iframes = 40
	stunFrame = 120
	if hp <= 0 {
		instance_create_depth(x,y,-401,oVormDefeat)
		iframes = 1000
		image_alpha = 1
		stunFrame = -1000
		instance_destroy(oVormStaff)
	}
}




