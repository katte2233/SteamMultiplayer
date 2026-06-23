//Entering and exiting tank
var _players = ds_list_create();
var _closePlayers = collision_circle_list(x,y,64,Obj_player,false,true,_players,false);
if(_closePlayers > 0)
{
	for (var _i = 0; _i < _closePlayers; ++_i)
	{
		with(_players[| _i])
		{
			if((interactKey)	&&	(0 >= interactCooldown))
			{
				if(instance_exists(Obj_tankHatch))
				{
					var _hatchCount = instance_number(Obj_tankHatch);
					var _hatchRandom = irandom(_hatchCount-1)
	
					var _hatch = instance_find(Obj_tankHatch,_hatchRandom);
					var _hatchX = _hatch.x;
					var _hatchY = _hatch.y + 16;
				}

				x = _hatchX;
				y = _hatchY;
				
				state = PLAYER_STATE.PLATFORM;
				interactCooldown = interactCooldownMax;
			}
		}
	}
}
ds_list_destroy(_players);

//Imprints
if(imprintCooldown < 0)
{
	var _ran = irandom(2);
		
	for (var _i = 0; _i < array_length(imprintsL); _i++)
	{
		if (instance_exists(imprintsL[_i])) imprintsL[_i].burst(1);
		imprintsL[_i].set_image_index(_ran + _i * 3);
		
		//Re set offset
		imprintsL[_i].set_offset(lengthdir_x(15,bodyDir+90) + lengthdir_x(20,bodyDir),
			lengthdir_y(15,bodyDir+90) + lengthdir_y(20,bodyDir));
	}
	
	for (var _i = 0; _i < array_length(imprintsR); _i++)
	{
		if (instance_exists(imprintsR[_i])) imprintsR[_i].burst(1);
		imprintsR[_i].set_image_index(_ran + _i * 3);
		
		//Re set offset
		imprintsR[_i].set_offset(lengthdir_x(15,bodyDir-90) + lengthdir_x(20,bodyDir),
			lengthdir_y(15,bodyDir-90) + lengthdir_y(20,bodyDir));
	}
		
	imprintCooldown = imprintCooldownMax;
}else imprintCooldown-=max(spd, 1);

//Ozone
if(ozoneCooldown < 0)
{
	for (var _i = 0; _i < array_length(ozone); _i++)
	{
		if (instance_exists(ozone[_i])) ozone[_i].burst(1);
		
		//Re set offset
		ozone[_i].set_offset(lengthdir_x(10,bodyDir+90) + lengthdir_x(20,bodyDir+180),
			lengthdir_y(10,bodyDir+90) + lengthdir_y(20,bodyDir+180));
		
		//Re set direction
		ozone[_i].set_direction(bodyDir+180-20,bodyDir+180+20);
		
		var _ran = random_range(0.4,0.8);
		ozone[_i].set_alpha(_ran,_ran+0.2,0);
	}
		
	ozoneCooldown = ozoneCooldownMax;
}else ozoneCooldown-=max(spd, 1);

//Movement
x+=lengthdir_x(spd,bodyDir);
y+=lengthdir_y(spd,bodyDir);
spd = clamp(spd,-(spdMax*0.6),spdMax);