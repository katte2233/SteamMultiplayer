///@desc Sync Player Position
send_player_positions();

//Sync points
for (var _i = 0; _i < array_length(playerList); _i++)
{
    var _player = playerList[_i]
    if (_player.character == undefined) continue
    if (_player.steamID == undefined) continue
    var _b = buffer_create(10, buffer_fixed, 1); //1+8+1
    buffer_write(_b, buffer_u8, NETWORK_PACKETS.PLAYER_POINTS);//1
    buffer_write(_b, buffer_u64, _player.steamID);//8
    buffer_write(_b, buffer_u8, _player.character.points);//1
		
    for (var _k = 0; _k < array_length(playerList); _k++)
    {
        if (playerList[_k].steamID != obj_Server.steamID)
        {
            steam_net_packet_send(playerList[_k].steamID, _b);
        }
    }
    buffer_delete(_b)
}

alarm[0] = 5;