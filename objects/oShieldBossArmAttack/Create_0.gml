

direction = point_direction(x,y,oPlayer.x,oPlayer.y-80)
image_angle = direction
if oPlayer.x < x { 
		image_xscale = -4
		direction = point_direction(oPlayer.x,oPlayer.y-80,x,y)
		image_angle = direction
	} else {
		image_xscale = 4
	}
image_yscale = 4
