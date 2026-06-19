hovered = false;
selected = false;
disabled = false;

selectAction = function () {
	global.client = instance_create_depth(0,0,0,Obj_client)
	steam_lobby_join_id(lobby_id)
	
	show_debug_message("Clicked!");
}

textColor = c_white