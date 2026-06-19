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
        if (playerList[_k].steamID != obj_DemoServer.steamID)
        {
            steam_net_packet_send(playerList[_k].steamID, _b);
        }
    }
    buffer_delete(_b)
}

//Sync ball
if(instance_exists(obj_Ball))
{
	var _b = buffer_create(14, buffer_fixed, 1); //1+2+2+2+1+2+2+2
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.BALL_SYNC);
	buffer_write(_b, buffer_u16, obj_Ball.x);
	buffer_write(_b, buffer_u16, obj_Ball.y);
	buffer_write(_b, buffer_f32, obj_Ball.direction); // r32 for float
	buffer_write(_b, buffer_f32, obj_Ball.speed);

	for (var _k = 0; _k < array_length(playerList); _k++)
	{
	    if (playerList[_k].steamID != obj_DemoServer.steamID)
	    {
	        steam_net_packet_send(playerList[_k].steamID, _b);
	    }
	}
	buffer_delete(_b);
}

alarm[0] = 1;