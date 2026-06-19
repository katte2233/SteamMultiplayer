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
		//Give points to the one who hit us
		with(_inst.creator) points++;
		
		//Get damaged
		moveSpeed = 1
		instance_destroy(_inst);
	}
}