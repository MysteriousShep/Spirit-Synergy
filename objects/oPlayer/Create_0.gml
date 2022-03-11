hp = 9
iframes = 0
hsp = 0
vsp = 0
grv = 0.3
godMode = false
noClip = false
walksp = 5
spirit = 21
state = "free"
frame = 0
hasWallJump = false
hasProjectile = true
hasDash = true
hasShieldBreak = false
wallJumpCooldown = 0
is_controller = oMenu.is_controller
player = oMenu.player
if variable_instance_exists(oMenu,"pad_num") {
	pad_num = oMenu.pad_num
}
cling = false
rmx = 1
rmy = 3
key_down = false
framesUntilControlable = 20
roomArray = [
				[Debug_Room,Debug_Room,Debug_Room,Debug_Room,Debug_Room,Debug_Room],
				[Debug_Room,Debug_Room,Debug_Room,Debug_Room,Debug_Room,Debug_Room],
				[Debug_Room,Debug_Room,Debug_Room,Debug_Room,Debug_Room,Debug_Room],
				[Room_1_2,Room_1_3,Room_2_3,Debug_Room,Debug_Room,Debug_Room],
				[Debug_Room,Debug_Room,Debug_Room,Debug_Room,Debug_Room,Debug_Room],
				[Debug_Room,Debug_Room,Debug_Room,Debug_Room,Debug_Room,Debug_Room]]
				

animations = {
	run : sFinleyRun,
	cling : sFinleyCling,
	dash : sFinleyDash,
	air : sFinleyAir,
	attack : sFinleyProjectile,
	airAttackUp : sFinleyProjectileAirUp,
	airAttackDown : sFinleyProjectileAirDown,
	shieldBreak : sFinleyShieldBreaker
}
global.pause = false