executeFunction = function ()
{
	with(executor)
	{
		controlling = Obj_tank;
		cam.target = Obj_tank;
		
		// Tell the server we are now controlling the tank
        if (!isHost)
        {
            var _b = buffer_create(1, buffer_fixed, 1);
            buffer_write(_b, buffer_u8, NETWORK_PACKETS.CLIENT_CONTROL_TANK);
            steam_net_packet_send(lobbyHost, _b);
            buffer_delete(_b);
        }
	}
}