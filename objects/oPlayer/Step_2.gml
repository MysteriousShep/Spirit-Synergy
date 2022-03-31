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

if keyboard_check_pressed(vk_f6) {
	room_goto(Room_2_5)
}
