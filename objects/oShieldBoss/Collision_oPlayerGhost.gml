

if iframes <= 0 {
	if instance_exists(oShieldBossBarrier) {
		shieldHp -= 1
		if shieldHp < 1 {
			if instance_exists(oShieldBossBarrier) instance_destroy(oShieldBossBarrier)
			attackFrame = 0
			oShieldBossArmor.stunFrame = 720
			if instance_exists(oShieldBossArmAttack) instance_destroy(oShieldBossArmAttack)
		}
		iframes = 20
		image_index = 0
	} else {
		hp -= 1
		image_alpha = 0.75
		iframes = 20
		stunFrame = 3
		other.hsp *= 0.75
		other.vsp *= 0.75
		if hp <= 0 {
			instance_destroy(self)
			instance_create_depth(x,y,-401,oShieldBossDefeat)
			iframes = 1000
			image_alpha = 1
			stunFrame = -1000
		}
		
	}
}
