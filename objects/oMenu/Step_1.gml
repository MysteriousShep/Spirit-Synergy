
if (keyboard_check_pressed(vk_f11)) {
	if (window_get_fullscreen()) {
		window_set_fullscreen(false);
	} else {
		window_set_fullscreen(true);
	}
}
if (keyboard_check_pressed(vk_escape)) {
	if window_get_fullscreen() {
		window_set_fullscreen(false);
	}
}
if is_controller {
	if gamepad_button_check_pressed(pad_num,gp_select) {
		game_restart();
	}
}