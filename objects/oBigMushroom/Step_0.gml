
bounceFrame -= 1
if bounceFrame > 0 {
	image_speed = 1
} else {
	image_speed = 0
	image_index = 0
}
if place_meeting(x,y,oPlayerGhost) and bounceFrame <= 0 {
	bounceFrame = 30
	image_index = 0
}


