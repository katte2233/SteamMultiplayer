///@desc Sync Player Position
send_player_positions();

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
	    if (playerList[_k].steamID != Obj_server.steamID)
	    {
	        steam_net_packet_send(playerList[_k].steamID, _b);
	    }
	}
	buffer_delete(_b);
}

alarm[0] = 5;