
switch(currentMenu) {
	case("title"):
		if (is_controller) {
			if (gamepad_axis_value(pad_num,gp_axislv) > 0) {
				if (delay <= 0) {
					chosenIndex -= 1;
					if (chosenIndex < 0) {
						chosenIndex = array_length(buttons)-1;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (gamepad_axis_value(pad_num,gp_axislv) < 0) {
				if (delay <= 0) {
					chosenIndex += 1;
					if (chosenIndex >= array_length(buttons)) {
						chosenIndex = 0;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (gamepad_button_check_pressed(pad_num,gp_face3) or gamepad_button_check_pressed(pad_num,gp_face1)) {
				switch(selectedButton) {
					case("start"):
						room_goto(Room_2_3);
						buttons = pauseButtons;
						currentMenu = "none";
						break;
					case("credits"):
						currentMenu = "credits";
						buttons = ["back"];
						selectedButton = "back";
						instance_create_layer(1280/2,704/2,"instances_1",oCredits);
				}
			}
			if (gamepad_axis_value(pad_num,gp_axislh) > 0 and selectedButton = "controls") {
				controls = "press"
			}
			if (gamepad_axis_value(pad_num,gp_axislh) < 0 and selectedButton = "controls") {
				controls = "flick"
			}
		} else {
			if (keyboard_check(ord("W")) or keyboard_check(vk_up)) {
				if (delay <= 0) {
					chosenIndex -= 1;
					if (chosenIndex < 0) {
						chosenIndex = array_length(buttons)-1;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (keyboard_check(ord("S")) or keyboard_check(vk_down)) {
				if (delay <= 0) {
					chosenIndex += 1;
					if (chosenIndex >= array_length(buttons)) {
						chosenIndex = 0;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)) {
				switch(selectedButton) {
					case("start"):
						room_goto(Room_2_3);
						buttons = pauseButtons;
						currentMenu = "none";
						break;
					case("credits"):
						currentMenu = "credits";
						buttons = ["back"];
						selectedButton = "back";
						instance_create_layer(1280/2,704/2,"instances_1",oCredits);
				}
			}
		}
		break;
	case("credits"):
		if (is_controller) {
			if (gamepad_axis_value(pad_num,gp_axislv) > 0) {
				if (delay <= 0) {
					chosenIndex -= 1;
					if (chosenIndex < 0) {
						chosenIndex = array_length(buttons)-1;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (gamepad_axis_value(pad_num,gp_axislv) < 0) {
				if (delay <= 0) {
					chosenIndex += 1;
					if (chosenIndex >= array_length(buttons)) {
						chosenIndex = 0;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (gamepad_button_check_pressed(pad_num,gp_face3) or gamepad_button_check_pressed(pad_num,gp_face1)) {
				switch(selectedButton) {
					case("back"):
						buttons = titleButtons;
						currentMenu = "title";
						selectedButton = "credits";
						break;
				}
			}
		} else {
			if (keyboard_check(ord("W")) or keyboard_check(vk_up)) {
				if (delay <= 0) {
					chosenIndex -= 1;
					if (chosenIndex < 0) {
						chosenIndex = array_length(buttons)-1;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (keyboard_check(ord("S")) or keyboard_check(vk_down)) {
				if (delay <= 0) {
					chosenIndex += 1;
					if (chosenIndex >= array_length(buttons)) {
						chosenIndex = 0;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)) {
				switch(selectedButton) {
					case("back"):
						buttons = titleButtons;
						currentMenu = "title";
						break;
				}
			}
		}
		break;
	case("pause"):
		if (is_controller) {
			if (gamepad_axis_value(pad_num,gp_axislv) > 0) {
				if (delay <= 0) {
					chosenIndex -= 1;
					if (chosenIndex < 0) {
						chosenIndex = array_length(buttons)-1;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (gamepad_axis_value(pad_num,gp_axislv) < 0) {
				if (delay <= 0) {
					chosenIndex += 1;
					if (chosenIndex >= array_length(buttons)) {
						chosenIndex = 0;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (gamepad_button_check_pressed(pad_num,gp_face3) or gamepad_button_check_pressed(pad_num,gp_face1)) {
				switch(selectedButton) {
					case("resume"):
						global.pause = false;
						currentMenu = "none";
						oPlayer.framesUntilControlable = 10;
						break;
					case("cheats"):
						currentMenu = "cheats";
						delay = 10;
						buttons = cheatButtons;
						chosenIndex = 0;
						selectedButton = buttons[chosenIndex];
						instance_create_layer(1280/2,704/2,"instances_1",oInvincibilityToggle);
						instance_create_layer(1280/2,704/2+64,"instances_1",oInfiniteSpiritToggle);
						instance_create_layer(1280/2,704/2+128,"instances_1",oBackButton);
						break;
				}
			}
			if (gamepad_button_check_pressed(pad_num,gp_face2) or gamepad_button_check_pressed(pad_num,gp_face4)) {
				currentMenu = "none";
				global.pause = false;
				oPlayer.framesUntilControlable = 10;
			}
		}
		break;
	case("cheats"):
		if (is_controller) {
			if (gamepad_axis_value(pad_num,gp_axislv) > 0) {
				if (delay <= 0) {
					chosenIndex -= 1;
					if (chosenIndex < 0) {
						chosenIndex = array_length(buttons)-1;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (gamepad_axis_value(pad_num,gp_axislv) < 0) {
				if (delay <= 0) {
					chosenIndex += 1;
					if (chosenIndex >= array_length(buttons)) {
						chosenIndex = 0;
					}
					selectedButton = buttons[chosenIndex];
					delay = 10;
				}
			}
			if (gamepad_button_check_pressed(pad_num,gp_face3) or gamepad_button_check_pressed(pad_num,gp_face1)) {
				switch(selectedButton) {
					case("back"):
						currentMenu = "pause";
						buttons = pauseButtons;
						chosenIndex = 0;
						selectedButton = buttons[chosenIndex];
						instance_create_layer(1280/2,704/2,"instances_1",oResumeButton);
						instance_create_layer(1280/2,704/2+64,"instances_1",oCheatsButton);
						break;
					case("invincibility"):
						oPlayer.godMode = not oPlayer.godMode;
						if (oPlayer.godMode) {
							oPlayer.image_blend = c_gray;
						} else {
							oPlayer.image_blend = c_white;
						}
						break;
					case("infinite spirit"):
						oPlayer.infiniteSpirit = not oPlayer.infiniteSpirit;
						break;
				}
			}
			if (gamepad_button_check_pressed(pad_num,gp_face2) or gamepad_button_check_pressed(pad_num,gp_face4)) {
				currentMenu = "pause";
				buttons = pauseButtons;
				chosenIndex = 0;
				selectedButton = buttons[chosenIndex];
				instance_create_layer(1280/2,704/2,"instances_1",oResumeButton);
				instance_create_layer(1280/2,704/2+64,"instances_1",oCheatsButton);
			}
			if (gamepad_axis_value(pad_num,gp_axislh) > 0 and selectedButton = "invincibility") {
				oPlayer.godMode = true;
				oPlayer.image_blend = c_gray;
			}
			if (gamepad_axis_value(pad_num,gp_axislh) < 0 and selectedButton = "invincibility") {
				oPlayer.godMode = false;
				oPlayer.image_blend = c_white;
			}
			if (gamepad_axis_value(pad_num,gp_axislh) > 0 and selectedButton = "infinite spirit") {
				oPlayer.infiniteSpirit = true;
			}
			if (gamepad_axis_value(pad_num,gp_axislh) < 0 and selectedButton = "infinite spirit") {
				oPlayer.infiniteSpirit = false;
			}
		}
}
delay -= 1;
if (room = Room_GameOver) {
	if (is_controller) {
		if (gamepad_button_check_pressed(pad_num,gp_face3)) {
			instance_destroy(oPlayer);
			instance_destroy(oSpiritBar);
			instance_destroy(oHealth);
			room_goto(Room_2_3);
			buttons = pauseButtons;
			currentMenu = "none";
		}
	}
}
if (room = Room_DemoOver) {
	if (is_controller) {
		if (gamepad_button_check_pressed(pad_num,gp_face3)) {
			game_restart();
		}
	}
}

