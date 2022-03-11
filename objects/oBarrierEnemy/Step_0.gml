
if stunFrame > 0 {
	x = stunX
	y = stunY
	x += random_range(-10,10)
	y += random_range(-3,3)
} else {
	stunX = x
	stunY = y
}

if iframes <= 0 {
	image_alpha = 1
}
stunFrame -= 1
if stunFrame == 0 {
	x = stunX
	y = stunY
}
iframes -= 1
if stunFrame <= 0 {
	if instance_exists(oPlayerGhost) {
		if (abs(x-oPlayerGhost.x) < range) {
			if !(instance_exists(oEnemyBarrier)) {
				instance_create_depth(x,y,1,oEnemyBarrier)
			}
		}
		else if (abs(x-oPlayer.x) < range) {
			if !(instance_exists(oEnemyBarrier)) {
				instance_create_depth(x,y,1,oEnemyBarrier)
			}
		}
		else {
			if instance_exists(oEnemyBarrier) {
				instance_destroy(oEnemyBarrier)
			}
		}
	}
	else if (abs(x-oPlayer.x) < range) {
		if !(instance_exists(oEnemyBarrier)) {
			instance_create_depth(x,y,1,oEnemyBarrier)
		}
	}
	else {
		if instance_exists(oEnemyBarrier) {
			instance_destroy(oEnemyBarrier)
		}
	}
}
