/// @description Setup Player

localSteamID = steam_get_user_steam_id();
lobbyHost = steam_lobby_get_owner_id();
isHost = steam_lobby_is_owner();
isLocal = (localSteamID == steamID)
image_index = lobbyMemberID

moveSpeed = 3;
fireCooldown = 50;
currentCooldown = 0;

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
imprint_snow(self);

init_controls()

alarm[0] = 5;