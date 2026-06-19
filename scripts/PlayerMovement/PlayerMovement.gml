function paddle_movement(){
	
	// Logic for runKey
	//if (runKey == true) then moveSpeed = 10
	//if (runKey == 0 and moveSpeed == 10) then moveSpeed = 5
	
	// Logic to apply movement
	var _spd = moveSpeed;
	
	if((xInput != 0)	&&	(yInput != 0)) _spd*= 0.707;
	
	move_and_collide(xInput*_spd,yInput*_spd,obj_Wall);
	
	// Logic for getting hit by bullet
	if (currentCooldown > 0) currentCooldown--;
}