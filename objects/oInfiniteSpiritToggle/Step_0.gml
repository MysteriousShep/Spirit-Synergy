


if not global.pause or oMenu.currentMenu != "cheats" {
	instance_destroy(self)
} else {
	if oPlayer.infiniteSpirit {
		if oMenu.selectedButton = "infinite spirit" {
			sprite_index = sInfiniteSpiritToggleOnSelected
		} else {
			sprite_index = sInfiniteSpiritToggleOn
		}
	} else {
		if oMenu.selectedButton = "infinite spirit" {
			sprite_index = sInfiniteSpiritToggleOffSelected
		} else {
			sprite_index = sInfiniteSpiritToggleOff
		}
	}
}
