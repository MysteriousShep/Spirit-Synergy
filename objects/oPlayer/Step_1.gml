
if iframes <= 0 and not godMode and state != "dash" and not global.pause {
	if place_meeting(x,y,oWallJumpBossOrb) {
		hp -= 2
		iframes = 30
		instance_destroy(oWallJumpBossOrb)
		if hp <= 0 {
			global.pause = true
			instance_create_depth(x,y,-401,oGameOverAnim)
			iframes = 0
		}
	}
	if place_meeting(x,y,oGoblinArrow) {
		hp -= 1
		iframes = 30
		instance_destroy(oGoblinArrow)
		if hp <= 0 {
			global.pause = true
			instance_create_depth(x,y,-401,oGameOverAnim)
			iframes = 0
		}
	}

	if place_meeting(x,y,oWallJumpBoss) and oWallJumpBoss.state = "dash" and oWallJumpBoss.image_index > 10 and oWallJumpBoss.image_index < 17 {
		hp -= 4
		iframes = 30
		if hp <= 0 {
			global.pause = true
			instance_create_depth(x,y,-401,oGameOverAnim)
			iframes = 0
		}
	}
	if place_meeting(x,y,oShieldBossArmAttack) and oShieldBossArmAttack.image_index > 8 and oShieldBossArmAttack.image_index < 12 {
		hp -= 2
		iframes = 30
		if hp <= 0 {
			global.pause = true
			instance_create_depth(x,y,-401,oGameOverAnim)
			iframes = 0
		}
	}
	if place_meeting(x,y,oVormGhost) and oVormGhost.lifetime > 0 {
		hp -= 1
		iframes = 20
		if hp <= 0 {
			global.pause = true
			instance_create_depth(x,y,-401,oGameOverAnim)
			iframes = 0
		}
	}
	if place_meeting(x,y,oVBlast) {
		hp -= 2
		iframes = 30
		if hp <= 0 {
			global.pause = true
			instance_create_depth(x,y,-401,oGameOverAnim)
			iframes = 0
		}
	}
}
