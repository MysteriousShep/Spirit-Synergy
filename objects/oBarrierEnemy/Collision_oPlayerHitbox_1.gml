
if iframes <= 0 {
	hp -= 2
	image_alpha = 0.5
	iframes = 60
	stunFrame = 80
	if hp <= 0 {
		instance_destroy(self)
		if instance_exists(oEnemyBarrier) {
			instance_destroy(oEnemyBarrier)
		}
	}
}