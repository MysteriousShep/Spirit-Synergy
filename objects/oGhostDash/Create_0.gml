/// @desc Get Initial Input
if instance_exists(oPlayer) {
	hspd = 0
	image_xscale = oPlayer.image_xscale
}
creator = noone
up = keyboard_check(ord("W")) or keyboard_check(vk_up)
down = keyboard_check(ord("S")) or keyboard_check(vk_down)
vspd = 0
lifetime = 6

image_yscale = 4