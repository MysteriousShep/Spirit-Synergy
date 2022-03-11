
switch(currentMenu) {
	case("title"):
		if (is_controller) {
			if (gamepad_axis_value(pad_num,gp_axislv) > 0) {
				switch(selectedButton) {
					case("start"):
						break
				}
			}
			if (gamepad_axis_value(pad_num,gp_axislv) < 0) {
				switch(selectedButton) {
					case("start"):
						break
				}
			}
			if (gamepad_button_check_pressed(pad_num,gp_face3) or gamepad_button_check_pressed(pad_num,gp_face1)) {
				switch(selectedButton) {
					case("start"):
						room_goto(Room_1_3)
						buttons = pauseButtons
						currentMenu = "none"
						break
				}
			}
		}
		break
	case("pause"):
		if is_controller {
			if (gamepad_axis_value(pad_num,gp_axislv) > 0) {
				if delay <= 0 {
					chosenIndex -= 1
					if chosenIndex < 0 {
						chosenIndex = array_length(buttons)-1
					}
					selectedButton = buttons[chosenIndex]
					delay = 10
				}
			}
			if (gamepad_axis_value(pad_num,gp_axislv) < 0) {
				if delay <= 0 {
					chosenIndex += 1
					if chosenIndex >= array_length(buttons) {
						chosenIndex = 0
					}
					selectedButton = buttons[chosenIndex]
					delay = 10
				}
			}
			if (gamepad_button_check_pressed(pad_num,gp_face3) or gamepad_button_check_pressed(pad_num,gp_face1)) {
				switch(selectedButton) {
					case("resume"):
						global.pause = false
						currentMenu = "none"
						oPlayer.framesUntilControlable = 10
						break
					case("cheats"):
						currentMenu = "cheats"
						delay = 10
						buttons = cheatButtons
						chosenIndex = 0
						selectedButton = buttons[chosenIndex]
						instance_create_layer(1280/2,704/2,"instances_1",oInvincibilityToggle)
						instance_create_layer(1280/2,704/2+64,"instances_1",oBackButton)
						break
				}
			}
			if gamepad_button_check_pressed(pad_num,gp_face2) or gamepad_button_check_pressed(pad_num,gp_face4) {
				currentMenu = "none"
				global.pause = false
				oPlayer.framesUntilControlable = 10
			}
		}
		break
	case("cheats"):
		if is_controller {
			if (gamepad_axis_value(pad_num,gp_axislv) > 0) {
				if delay <= 0 {
					chosenIndex -= 1
					if chosenIndex < 0 {
						chosenIndex = array_length(buttons)-1
					}
					selectedButton = buttons[chosenIndex]
					delay = 10
				}
			}
			if (gamepad_axis_value(pad_num,gp_axislv) < 0) {
				if delay <= 0 {
					chosenIndex += 1
					if chosenIndex >= array_length(buttons) {
						chosenIndex = 0
					}
					selectedButton = buttons[chosenIndex]
					delay = 10
				}
			}
			if (gamepad_button_check_pressed(pad_num,gp_face3) or gamepad_button_check_pressed(pad_num,gp_face1)) {
				switch(selectedButton) {
					case("back"):
						currentMenu = "pause"
						buttons = pauseButtons
						chosenIndex = 0
						selectedButton = buttons[chosenIndex]
						instance_create_layer(1280/2,704/2,"instances_1",oResumeButton)
						instance_create_layer(1280/2,704/2+64,"instances_1",oCheatsButton)
						break
					case("invincibility"):
						oPlayer.godMode = not oPlayer.godMode
						if oPlayer.godMode {
							oPlayer.image_blend = c_gray
						} else {
							oPlayer.image_blend = c_white
						}
						break
				}
			}
			if gamepad_button_check_pressed(pad_num,gp_face2) or gamepad_button_check_pressed(pad_num,gp_face4) {
				currentMenu = "pause"
				buttons = pauseButtons
				chosenIndex = 0
				selectedButton = buttons[chosenIndex]
				instance_create_layer(1280/2,704/2,"instances_1",oResumeButton)
				instance_create_layer(1280/2,704/2+64,"instances_1",oCheatsButton)
			}
			if (gamepad_axis_value(pad_num,gp_axislh) > 0 and selectedButton = "invincibility") {
				oPlayer.godMode = true
				oPlayer.image_blend = c_gray
			}
			if (gamepad_axis_value(pad_num,gp_axislh) < 0) and selectedButton = "invincibility" {
				oPlayer.godMode = false
				oPlayer.image_blend = c_white
			}
		}
}
delay -= 1