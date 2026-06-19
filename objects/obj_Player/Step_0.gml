/// @description Movement & Actions based off of Input
get_controls(isHost, isLocal)

paddle_movement()

// Logic for shooting a bullet
if (actionKey == 1 && currentCooldown <= 0)
{
	with(instance_create_depth(x > room_width/2 ? bbox_left-10 : bbox_right+10,y, -100, obj_Bullet))
	{
		image_index = other.image_index;
		creator = other.id;
	}
	currentCooldown = fireCooldown
}

//Bullet collision
var _inst = (instance_place(x,y,obj_Bullet))
if(_inst != noone)
{
	//If we do not collide with our own bullet
	if(_inst.image_index != image_index)
	{
		//Get damaged
		instance_destroy(_inst);
	}
}

//Idle vs Running animation + Imprints
if(xInput != 0)	||	(yInput != 0)
{
	if(imprintCooldown < 0)
	{
		imprint_snow(self);
		
		imprintCooldown = imprintCooldownMax;
	}else imprintCooldown--;
	
	column = 1;
	framesPerSec = 20;
}else{
	column = 0;
	framesPerSec = 5;
}

//Animation
if (steamID == steam_get_user_steam_id())
{
    if(animationCounter >= animationCounterMax)
	{
		frame++;
		if(frameMax < frame) frame = 0;
		
		animationCounter = 0;
	}else{
		animationCounter += framesPerSec;
	}
}