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
column = 0;

//Snow imprints
imprintCooldown = 1;
imprintCooldownMax = 0;
imprint_snow(self);

init_controls()