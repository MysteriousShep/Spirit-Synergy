if iframes <= 0 {
	hp -= 2
	image_alpha = 0.5
	iframes = 40
	stunFrame = 180
	if hp <= 0 {
		instance_destroy(self)
	}
}

