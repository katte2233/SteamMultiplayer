/// @description Setup Player

//Multiplayer stuff
localSteamID = steam_get_user_steam_id();
lobbyHost = steam_lobby_get_owner_id();
isHost = steam_lobby_is_owner();
isLocal = (localSteamID == steamID)
image_index = lobbyMemberID

//Managing
cam = undefined; //Our camera

//State
state = PLAYER_STATE.TOP_DOWN;

	//Top-down
	moveSpeed = 3;
	fireCooldown = 50;
	currentCooldown = 0;
	
	//Platform
	hSpd = 0;
	vSpd = 0;
	grv = 0.2;
	jumpForce = 6;
	grounded = true;
	
	tilemap = layer_tilemap_get_id(layer_get_id("Tiles"));
	
//Tank interactive grid items
interactCooldown = 0; //The current cooldown for the next time we can interact with something
interactCooldownMax = 10; //The max cooldown for the next time we can interact with something

controlling = noone; //Used for piloting different vehicles, like the tank

//Sprite sheet
frame = 0;
frameMax = 3;
column = 0;

framesPerSec = 5;
animationCounter = 0;
animationCounterMax = 60;

//Snow imprints
imprintCooldown = 0;
imprintCooldownMax = 1;
imprints = imprint_snow(self,0,0);
for (var _i = 0; _i < array_length(imprints); _i++)
{
	if (instance_exists(imprints[_i])) imprints[_i].burst(1);
}

init_controls()

alarm[0] = 5;