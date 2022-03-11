
if iframes <= 0 and not godMode and state != "dash" {
	if place_meeting(x,y,oWallJumpBossOrb) {
		hp -= 2
		iframes = 30
		instance_destroy(oWallJumpBossOrb)
		if hp <= 0 {
			room_goto(Room_GameOver)
			grv = 0
			walksp = 0
			hasDash = false
			hasProjectile = false
			hasShieldBreak = false
			hasWallJump = false
		}
	}

	if place_meeting(x,y,oWallJumpBoss) and oWallJumpBoss.state = "dash" and oWallJumpBoss.image_index > 10 and oWallJumpBoss.image_index < 17 {
		hp -= 4
		iframes = 30
		if hp <= 0 {
			room_goto(Room_GameOver)
			grv = 0
			walksp = 0
			hasDash = false
			hasProjectile = false
			hasShieldBreak = false
			hasWallJump = false
			
		}
	}
}
