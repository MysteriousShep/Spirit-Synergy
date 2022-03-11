/// @desc Get New Controllers
switch(async_load[? "event_type"]) {
	case "gamepad discovered":
		oPlayer.pad_num = oMenu.pad_num;
		oPlayer.is_controller = true;
	    break;
	case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
		oPlayer.is_controller = false;
		global.pause = true;
		oMenu.buttons = ["resume"];
		oMenu.currentMenu = "pause";
		oMenu.selectedButton = "resume";
		oMenu.chosenIndex = 0;
		break;
}