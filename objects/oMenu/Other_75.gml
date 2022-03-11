/*
/// @desc Get New Controllers
switch(async_load[? "event_type"]) {
	case "gamepad discovered":
		var pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
	    gamepad_set_axis_deadzone(pad, 0.5);       // Set the "deadzone" for the axis
	    gamepad_set_button_threshold(pad, 0.1);    // Set the "threshold" for the triggers
	    if !(is_controller)         // Check to see if an instance is associated with this pad index
	        {
	        // Create a player object and assign it a pad number
		    player[pad] = self
		    with (player[pad])
		        {
		        is_controller = true
		        pad_num = pad
		        }
			}
	    break;
case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
    var pad = async_load[? "pad_index"];       // Get the pad index
    if (instance_exists(player[pad]))          // Check for a player instance associated with the pad and remove it
        {
        with (player[pad])
            {
				is_controller = false
            }
        player[pad] = noone;                   // Set the controller array to "noone" so it detects a new pad being connected
        }
    break;
}
*/
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
