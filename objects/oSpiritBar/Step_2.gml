/// @desc Update Image
image_index = 21 - oPlayer.spirit
if oPlayer.infiniteSpirit {
	sprite_index = sSpiritBarInfinite
} else sprite_index = sSpiritBar

if keyboard_check_pressed(vk_f1) {
	oPlayer.hasProjectile = not oPlayer.hasProjectile
}
if keyboard_check_pressed(vk_f2) {
	oPlayer.hasWallJump = not oPlayer.hasWallJump
}
if keyboard_check_pressed(vk_f3) {
	oPlayer.hasDash = not oPlayer.hasDash
}
if keyboard_check_pressed(vk_f4) {
	oPlayer.hasShieldBreak = not oPlayer.hasShieldBreak
}


if room = Room_GameOver {
	image_blend = c_black
	visible = false
}


