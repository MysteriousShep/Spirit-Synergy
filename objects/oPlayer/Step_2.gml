if room != Room_GameOver {
	if x > room_width {
		rmx++
		room_goto(roomArray[rmy][rmx])
		x = 12
	} else if x < 0 {
		rmx--
		room_goto(roomArray[rmy][rmx])
		x = room_width-12
	} else if y < 0 {
		rmy--
		room_goto(roomArray[rmy][rmx])
		y = room_height-20
		vsp = -10
	} else if y > room_height {
		rmy++
		room_goto(roomArray[rmy][rmx])
		y = 20
	}
}

if keyboard_check_pressed(vk_f1) {
	room_goto(Room_4_5)
	x = 1216
	y = 640
	rmx = 3
	rmy = 5
}
if keyboard_check_pressed(vk_f2) {
	room_goto(Room_4_2)
	x = 1056
	y = 576
	rmy = 2
	rmx = 3
}
if keyboard_check_pressed(vk_f3) {
	room_goto(Room_7_3)
	x = 64
	y = 256
	rmy = 3
	rmx = 6
}

if keyboard_check_pressed(vk_f8) {
	oPlayer.hasWallJump = not oPlayer.hasWallJump
}
if keyboard_check_pressed(vk_f9) {
	oPlayer.hasShieldBreak = not oPlayer.hasShieldBreak
}



