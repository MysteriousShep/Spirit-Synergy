
stunFrame = 0
stunX = x
stunY = y
iframes = 0
hp = 20
hsp = 0
vsp = 0
grv = 0.3
walksp = 5
spirit = 21
state = "free"
frame = 60
hasWallJump = true
wallJumpCooldown = 0
cling = false
nextAttack = "attack"
prevAttack = "jump1"
if oPlayer.hasWallJump {
	instance_destroy(self)
}
