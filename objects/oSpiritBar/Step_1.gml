
if oPlayer.is_controller {
	if gamepad_button_check_pressed(oPlayer.pad_num,gp_start) {
		global.pause = not global.pause
		oMenu.currentMenu = "pause"
		oMenu.selectedButton = "resume"
		instance_create_layer(1280/2,704/2,"instances_1",oResumeButton)
		instance_create_layer(1280/2,704/2+64,"instances_1",oCheatsButton)
	}
}