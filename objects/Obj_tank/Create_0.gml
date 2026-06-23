//Tank hatch position
if(instance_exists(Obj_tankHatch))
{
	var _hatchCount = instance_number(Obj_tankHatch);
	var _hatchRandom = irandom(_hatchCount-1)
	
	var _hatch = instance_find(Obj_tankHatch,_hatchRandom);
	var _hatchX = _hatch.x;
	var _hatchY = _hatch.y + 16;
}

//Movement variables
bodyDir = 0; //Direction of main body
cannonDir = 0; //Direction of main cannon

spd = 0;
spdMax = 3;
acc = 0.1;
turningSpd = 2;

//Imprints
imprintCooldown = 0;
imprintCooldownMax = 3;

imprintsL = imprint_snow(self,lengthdir_x(15,bodyDir+90),
	lengthdir_y(15,bodyDir+90));

for (var _i = 0; _i < array_length(imprintsL); _i++)
{
	if (instance_exists(imprintsL[_i])) imprintsL[_i].burst(1);
}

imprintsR = imprint_snow(self,lengthdir_x(15,bodyDir-90) + lengthdir_x(15,bodyDir),
	lengthdir_y(15,bodyDir-90) + lengthdir_y(15,bodyDir));
	
for (var _i = 0; _i < array_length(imprintsR); _i++)
{
	if (instance_exists(imprintsR[_i])) imprintsR[_i].burst(1);
}

//Ozone
ozoneCooldown = 0;
ozoneCooldownMax = 4;

ozone = emit_ozone(self,lengthdir_x(10,bodyDir+90),
	lengthdir_y(20,bodyDir+180),1,bodyDir+180);

for (var _i = 0; _i < array_length(ozone); _i++)
{
	if (instance_exists(ozone[_i])) ozone[_i].burst(1);
}