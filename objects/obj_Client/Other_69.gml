/*var _event = async_load[? "event_type"]

switch (_event)
{
    case "lobby_joined":
        var _result = async_load[? "result"]
        if (_result == 1) // Success
        {
            var _lobby_id = async_load[? "lobby_id"]
            global.lobby_id = _lobby_id
            
            // Get host's steamID
            var _host_id = steam_lobby_get_owner_id(_lobby_id)
            
            // Are we the host or a joining player?
            if (_host_id == steam_get_user_steam_id())
            {
                // We are the host
                global.is_host = true
            }
            else
            {
                // We are a client joining
                global.is_host = false
                on_player_connect(steam_get_user_steam_id())
            }
        }
        else
        {
            show_debug_message("Failed to join lobby: " + string(_result))
        }
    break;
    
    case "lobby_chat_update":
        var _change = async_load[? "change_state"]
        var _steam_id = async_load[? "user_id"]
        
        switch (_change)
        {
            case 1: // Player joined
                on_player_connect(_steam_id)
            break;
            
            case 2: // Player left
                on_player_disconnect(_steam_id)
            break;
            
            case 4: // Player disconnected
                on_player_disconnect(_steam_id)
            break;
        }
    break;
    
    case "lobby_left":
        on_player_disconnect(steam_get_user_steam_id())
        global.lobby_id = undefined
    break;
}