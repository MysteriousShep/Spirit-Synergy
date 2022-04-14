if iframes <= 0 {
	if instance_exists(oShieldBossBarrier) {
		shieldHp -= 5
		if shieldHp < 1 {
			if instance_exists(oShieldBossBarrier) instance_destroy(oShieldBossBarrier)
			attackFrame = 0
			oShieldBossArmor.stunFrame = 600
			if instance_exists(oShieldBossArmAttack) instance_destroy(oShieldBossArmAttack)
		}
		iframes = 40
	} else {
		hp -= 2
		image_alpha = 0.5
		iframes = 40
		stunFrame = 180
		if hp <= 0 {
			instance_destroy(self)
		}
		
	}
}
