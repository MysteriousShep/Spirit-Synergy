if lifetime > 45 {
	direction = point_direction(x,y,oPlayer.x,oPlayer.y-40);
	speed += 0.5;
	if(abs(x-oPlayer.x) < 30)
{
	if(abs(y-(oPlayer.y-40)) < 30)
	{
		instance_destroy(self);
		with oPlayer {
			hasWallJump = true;
			hp = 9;
			var text = instance_create_layer(x,y-80,"instances_1",oUnlockedText)
			with text {
				sprite_index = sWallJumpGet
			}
		}
	}
}
} else {
	speed *= 0.9;
}
lifetime += 1;
distX = x-xprevious;
distY = y-yprevious;
var i = 0;
repeat(10) {
	instance_create_depth(x-distX*i,y-distY*i,0,oWallJumpGiverParticle);
	i += 0.1;
}
