

instance_destroy(self)
instance_destroy(oWallJumpBoss)
global.pause = false
repeat(10) {
	instance_create_depth(x+random_range(-20,20),y-random_range(30,50),-402,oWallJumpGiver)
}
oPlayer.framesUntilControlable = 60
