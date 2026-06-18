///@desc Listening to server

///@desc Listening to server
switch(async_load[? "event_type"])
{
    case "lobby_chat_update":
        var _fromID = async_load[? "user_id"];
        var _fromName = steam_get_user_persona_name_sync(_fromID);
        
        // Player joined
        if (async_load[? "change_flags"] & steam_lobby_member_change_entered)
        {
            show_debug_message("Player joined: " + _fromName)
            
            // Check if this is a reconnection
            var _existing_slot = -1
            for (var _i = 0; _i < array_length(playerList); _i++)
            {
                if (playerList[_i].steamID == _fromID)
                {
                    _existing_slot = _i
                    break
                }
            }
            
            if (_existing_slot != -1)
            {
                // Reconnecting player - restore their slot
                show_debug_message("Player reconnected: " + _fromName)
                playerList[_existing_slot].connected = true
                
                // Resync their existing data back to them
                send_player_sync(_fromID)
                send_player_spawn(_fromID, playerList[_existing_slot].lobbyMemberID)
            }
            else
            {
                // Brand new player
                var _slot = array_length(playerList)
                array_push(playerList,
                {
                    steamID: _fromID,
                    steamName: _fromName,
                    character: undefined,
                    startPos: grab_spawn_point(_slot),
                    lobbyMemberID: _slot,
                    connected: true
                });
                
                send_player_sync(_fromID)
                send_player_spawn(_fromID, _slot)
            }
        }
        
        // Player left
        if (async_load[? "change_flags"] & steam_lobby_member_change_left)
        {
            show_debug_message("Player left: " + _fromName)
            for (var _i = 0; _i < array_length(playerList); _i++)
            {
                if (playerList[_i].steamID == _fromID)
                {
                    playerList[_i].connected = false
                    // Optionally destroy their character instance
                    if (playerList[_i].character != undefined)
                    {
                        instance_destroy(playerList[_i].character)
                        playerList[_i].character = undefined
                    }
                    break
                }
            }
        }
        
        // Player disconnected (dropped)
        if (async_load[? "change_flags"] & steam_lobby_member_change_disconnected)
        {
            show_debug_message("Player disconnected: " + _fromName)
            for (var _i = 0; _i < array_length(playerList); _i++)
            {
                if (playerList[_i].steamID == _fromID)
                {
                    playerList[_i].connected = false
                    if (playerList[_i].character != undefined)
                    {
                        instance_destroy(playerList[_i].character)
                        playerList[_i].character = undefined
                    }
                    break
                }
            }
        }
        break;
}

/*switch(async_load[? "event_type"])
{
	case "lobby_chat_update":
		var _fromID = async_load[?"user_id"]; //Steam ID
		var _fromName = steam_get_user_persona_name_sync(_fromID); //Steam Player Name
		if(async_load[?"change_flags"] & steam_lobby_member_change_entered)
		{
			show_debug_message("Player joined: " + _fromName)
			var _slot = array_length(playerList)
			array_push(playerList,
			{
				steamID: _fromID,
				steamName: _fromName,
				character: undefined,
				startPos: grab_spawn_point(_slot),
				lobbyMemberID: _slot
			});
			
			send_player_sync(_fromID);
			send_player_spawn(_fromID,_slot);
		}
		break;
}