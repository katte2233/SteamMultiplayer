///@desc Listening to server

switch(async_load[? "event_type"])
{
	case "lobby_chat_update":
		var _fromID = async_load[?"user_id"]; //Steam ID
		var _fromName = steam_get_user_persona_name_sync(_fromID); //Steam Player Name
		if(async_load[?"change_flags"] & steam_lobby_member_change_entered)
		{
			show_debug_message("Player joined: " + _fromName)
			var _slot = array_length(playerList)
		}
		break;
}