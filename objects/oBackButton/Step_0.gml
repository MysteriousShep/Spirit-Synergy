
if not global.pause or oMenu.currentMenu != "cheats" and oMenu.currentMenu != "title" {
	instance_destroy(self)
} else {
	if oMenu.selectedButton = "back" {
		sprite_index = sBackButtonSelected
	} else {
		sprite_index = sBackButton
	}
}