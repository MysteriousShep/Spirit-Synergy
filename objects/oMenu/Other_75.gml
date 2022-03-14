
/// @desc Get New Controllers
switch(async_load[? "event_type"]) {
	case "gamepad discovered":
		var pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
	    gamepad_set_axis_deadzone(pad, 0.5);       // Set the "deadzone" for the axis
	    gamepad_set_button_threshold(pad, 0.1);    // Set the "threshold" for the triggers
		is_controller = true
		pad_num = pad
		if instance_exists(oPlayer) oPlayer.pad_num = pad_num;
		if instance_exists(oPlayer) oPlayer.is_controller = true;
	    break;
	case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
		if instance_exists(oPlayer) {
			oPlayer.is_controller = false;
			global.pause = true;
			buttons = ["resume"];
			currentMenu = "pause";
			selectedButton = "resume";
			chosenIndex = 0;
			instance_create_depth(1280/2,704/2,-401,oConnectController);
		}
		break;
}
