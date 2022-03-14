
if not global.pause or oMenu.currentMenu != menu {
	instance_destroy(self)
} else {
	if oMenu.selectedButton = button {
		sprite_index = buttonSpriteSelected
	} else {
		sprite_index = buttonSprite
	}
}