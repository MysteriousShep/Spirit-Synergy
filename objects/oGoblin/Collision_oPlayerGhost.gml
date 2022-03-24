

if iframes <= 0 {
	hp -= 1
	image_alpha = 0.75
	iframes = 20
	stunFrame = 3
	if hp <= 0 {
		instance_destroy(self)
	}
}
