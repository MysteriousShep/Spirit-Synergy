

if iframes <= 0 {
	if instance_exists(oShieldBossBarrier) {
		shieldHp -= 1
		if shieldHp < 1 {
			if instance_exists(oShieldBossBarrier) instance_destroy(oShieldBossBarrier)
			attackFrame = 0
			oShieldBossArmor.stunFrame = 600
			if instance_exists(oShieldBossArmAttack) instance_destroy(oShieldBossArmAttack)
		}
		iframes = 20
	} else {
		hp -= 1
		image_alpha = 0.75
		iframes = 20
		stunFrame = 3
		other.hsp *= 0.75
		other.vsp *= 0.75
		if hp <= 0 {
			instance_destroy(self)
		}
		
	}
}
