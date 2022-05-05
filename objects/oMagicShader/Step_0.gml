if not global.pause {
	image_alpha = min(0.1,image_alpha+0.001)
	instance_create_layer(0,0,"instances",oMagicParticle)
}



