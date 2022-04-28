

if oMenu.currentMenu != menu {
	image_alpha = 0
} else {
	image_alpha = 1
	if oMenu.selectedButton = button {
		sprite_index = buttonSpriteSelected
	} else {
		sprite_index = buttonSprite
	}
}
