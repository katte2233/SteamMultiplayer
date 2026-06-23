if (instance_exists(character))
{
	target = character; //Who to follow

	character.cam = self;
}else alarm[1] = 5;