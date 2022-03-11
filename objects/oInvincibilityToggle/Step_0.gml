


if not global.pause or oMenu.currentMenu != "cheats" {
	instance_destroy(self)
} else {
	if oPlayer.godMode {
		if oMenu.selectedButton = "invincibility" {
			sprite_index = sInvincibilityToggleOnSelected
		} else {
			sprite_index = sInvincibilityToggleOn
		}
	} else {
		if oMenu.selectedButton = "invincibility" {
			sprite_index = sInvincibilityToggleOffSelected
		} else {
			sprite_index = sInvincibilityToggleOff
		}
	}
}
