hovered = false;
selected = false;
disabled = false;

selectAction = function () {
	global.client = instance_create_depth(0,0,0,obj_Client)
	steam_lobby_list_join(lobby_index)
}

textColor = c_white