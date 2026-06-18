///@desc Listening for Lobby Creation

switch(async_load[?"event_type"])
{
	case "lobby_created":
		show_debug_message("Lobby created: " + string(steam_lobby_get_lobby_id()) + "!");
		steam_lobby_join_id(steam_lobby_get_lobby_id());
		break;
	
	case "lobby_joined":
		
		if(steam_lobby_is_owner())
		{
			steam_lobby_set_data("isGamemakerTest", "true");
			steam_lobby_set_data("Creator", steam_get_persona_name());
			
	        // Add host to playerList
	        array_push(obj_Server.playerList,
	        {
	            steamID: steam_get_user_steam_id(),
	            steamName: steam_get_persona_name(),
	            character: undefined,
	            startPos: grab_spawn_point(0),
	            lobbyMemberID: 0
	        });
		}
		
		room_goto(rm_GameRoom);
		break;
}