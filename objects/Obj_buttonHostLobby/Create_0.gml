// Inherit the parent event
event_inherited();

selectAction = function() {
	global.server = instance_create_depth(0,0,0,Obj_server)
	steam_lobby_create(steam_lobby_type_public,4);
}