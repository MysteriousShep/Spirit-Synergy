/// @description Insert description here
// You can write your code in this editor

y += 1
x += random_range(-1, 1)

if place_meeting(x, y, oWall){
	
	if !place_meeting(x, y, oMushroom){
		instance_create_depth(x, y, -1, oMushroom)
		
	}
	instance_destroy(self)
}