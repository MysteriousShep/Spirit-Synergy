
if not global.pause or oMenu.currentMenu != "pause" {
	instance_destroy(self)
} else {
	if oMenu.selectedButton = "cheats" {
		sprite_index = sCheatsButtonSelected
	} else {
		sprite_index = sCheatsButton
	}
}
