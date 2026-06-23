function movement_top_down()
{
	// Logic to apply movement
	var _spd = moveSpeed;
	
	if((xInput != 0)	&&	(yInput != 0)) _spd*= 0.707;
	
	move_and_collide(xInput*_spd,yInput*_spd,Obj_col);
}

function movement_platform()
{
	// Horizontal movement
	hSpd = xInput * moveSpeed;

	// Apply gravity
	vSpd += grv;

	// Jump
	if (jumpKey && grounded)
	{
	    vSpd = -jumpForce;
		show_debug_message("jumped");
	}

	// Horizontal collision
	var _subPixel = .5;
	if (place_meeting(x + hSpd, y, Obj_col))
	{
		//First check for slope
		if (!place_meeting(x + hSpd, y - abs(hSpd)-1, Obj_col))
		{
			while (place_meeting(x+hSpd, y, Obj_col)) y -= _subPixel;
		}else{
			//Scoot up to wall
			var _pixelCheck = _subPixel * sign(hSpd);
		    while (!place_meeting(x + _pixelCheck, y, Obj_col)) x += _pixelCheck;
			
			hSpd = 0;
		}
	}
	
	//Go down slopes
	if(vSpd >= 0)	&&	(!place_meeting(x + hSpd, y + 1, Obj_col))	&&	(place_meeting(x + hSpd, y + abs(hSpd)+1, Obj_col))
	{
		while (!place_meeting(x+hSpd, y + _subPixel, Obj_col)) y += _subPixel;
	}
		
	x += hSpd;

	// Vertical collision
	if (place_meeting(x, y + vSpd, Obj_col))
	{
		var _pixelCheck = _subPixel * sign(vSpd);
	    while (!place_meeting(x, y + _pixelCheck, Obj_col)) y += sign(vSpd);
	    grounded = (vSpd > 0); // only grounded if falling
	    vSpd = 0;
	}
	y += vSpd;

	// Update grounded
	grounded = place_meeting(x, y + 1, Obj_col);
}