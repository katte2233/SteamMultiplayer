/// @description Movement & Actions based off of Input
get_controls(isHost, isLocal)

if(steamID == localSteamID) direction = point_direction(x,y,mouse_x,mouse_y);

switch(state)
{
	case PLAYER_STATE.TOP_DOWN:
		movement_top_down()

		//Idle vs Running animation + Imprints
		if(xInput != 0)	||	(yInput != 0)
		{
			if(imprintCooldown < 0)
			{
				var _ran = irandom(2);
		
				for (var _i = 0; _i < array_length(imprints); _i++)
				{
					if (instance_exists(imprints[_i])) imprints[_i].burst(1);
					imprints[_i].set_image_index(_ran + _i * 3);
				}
		
				imprintCooldown = imprintCooldownMax;
			}else imprintCooldown--;
	
			column = 1;
			framesPerSec = 20;
		}else{
			column = 0;
			framesPerSec = 5;
		}


		break;
	
	case PLAYER_STATE.PLATFORM:
		//Deciding appropriate movement
		if(controlling == noone)
		{
			//Normal movement if we aren't piloting anything
			movement_platform();
			
			//Idle vs Running animation + Imprints
			if(xInput != 0)
			{
				column = 1;
				framesPerSec = 20;
			}else{
				column = 0;
				framesPerSec = 5;
			}
			
		}else{
			if(controlling == Obj_tank)
			{
				//Tank movement if we are controlling the tank
				with (Obj_tank)
				{
				    if (other.upKey)    spd += acc;
				    if (other.downKey)  spd -= acc;
					
					var _spd = max(abs(spd), 1);
					if (other.rightKey) bodyDir -= turningSpd / _spd;
					if (other.leftKey)  bodyDir += turningSpd / _spd;
				}
			}
		}
		
		
		//Tank interactive grid items
		if(instance_exists(Obj_tankGridItem))
		{
			var _nearestGridItem = instance_nearest(mouse_x,mouse_y,Obj_tankGridItem)
			if((interactKey)	&&	(0 >= interactCooldown))
			{
				with(_nearestGridItem)
				{
					if(distance_to_point(mouse_x,mouse_y) < 4)
					{
						executor = other;
						executeFunction();
					}
				}
				
				//Set cooldown
				interactCooldown = interactCooldownMax;
			}
		}
		
		break;
}

//Interact cooldown countdown
if (interactCooldown > 0) interactCooldown--;

//Animation
if(animationCounter >= animationCounterMax)
{
	frame++;
	if(frameMax < frame) frame = 0;
		
	animationCounter = 0;
}else{
	animationCounter += framesPerSec;
}