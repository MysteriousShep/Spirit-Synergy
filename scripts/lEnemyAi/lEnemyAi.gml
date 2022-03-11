

/// @function                 enemy_ai(walksp,grv,jumpsp,*velocity_based,*friction);
/// @param {walksp} walk_speed How fast it moves
/// @param {grv} gravity How fast it falls
/// @param {jumpsp} jump_velocity How high it jumps
/// @param {*velocity_based} velocity_based Does it slide?
/// @param {*friction} friction How much speed it loses each frame(0.0-1.0)
/// @description use basic enemy physics
function enemy_ai(walksp,grv,jumpsp,velocity_based=false,friction=0.95){
	var move = self.key_right - self.key_left
	if self.wallJumpCooldown <= 0 {
		if (velocity_based) self.hsp += move * walksp else self.hsp = move * walksp
	}
	self.vsp = self.vsp + grv

	if (place_meeting(x,y+1,oWall)) and (self.key_jump)
	{
		self.vsp = -jumpsp
	}



	//Horizontal Collision
	if (place_meeting(x+self.hsp,y,oWall)) 
	{
	
		repeat(8)
		{
			if (place_meeting(x+self.hsp, y, oWall)) y -= 1;
		}
	
		if (place_meeting(x+self.hsp, y, oWall))
		{
			while (!place_meeting(x+sign(self.hsp),y,oWall))
			{
				x = x + sign(self.hsp);
			}
			if (not self.hasWallJump) self.hsp = 0;
			y += 8
			if self.hasWallJump {
				if (place_meeting(x+self.hsp,y-64,oWall)) and collision_point(x+self.hsp+sign(self.hsp)*14,y,oWall,false,true) and (state == "free" or state == "dash") {
					self.vsp = 0
					if not place_meeting(x,y+1,oWall)  {
						self.cling = true
						image_xscale = -sign(self.hsp)*4
					} else {
						self.cling = false
					}
					if self.key_jump and self.wallJumpCooldown <= 0 {
						self.vsp = -10
						if not place_meeting(x,y+1,oWall) { 
							self.hsp = sign(self.hsp)*-walksp
						} else {
							self.hsp = 0
						}
						self.wallJumpCooldown = 20
						self.cling = false
					} else {
						self.hsp = 0
					}
				
				} else {
					self.hsp = 0
					self.cling = false
				}
			
			}
		}
	} else {
		self.cling = false
	}
	self.wallJumpCooldown -= 1
	
	x = x + self.hsp
	if (velocity_based) {
		self.hsp *= friction
	}
	//Vertical Collision
	if (place_meeting(x,y+self.vsp,oWall))
	{
		while (!place_meeting(x,y+sign(self.vsp),oWall))
		{
			y = y + sign(self.vsp)
		}	
		self.vsp = 0
	}

	y = y + self.vsp
}