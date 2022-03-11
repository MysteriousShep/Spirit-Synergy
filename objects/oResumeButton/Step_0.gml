
if not global.pause or oMenu.currentMenu != "pause" {
	instance_destroy(self)
} else {
	if oMenu.selectedButton = "resume" {
		sprite_index = sResumeButtonSelected
	} else {
		sprite_index = sResumeButton
	}
}
