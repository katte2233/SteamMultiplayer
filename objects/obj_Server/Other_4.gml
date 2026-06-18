///@desc Spawn Players

var _playerLayer = layer_get_id("Instances")

for (var _player = 0; _player < array_length(playerList); _player++)
{
	var _pos = grab_spawn_point(_player);
	var _inst = instance_create_layer(_pos.x,_pos.y,_playerLayer,obj_Player,
		{
			steamName	: playerList[_player].steamName,
			steamID		: playerList[_player].steamID,
			lobbyMemberID: _player
		});
	playerList[_player].charcter = _inst;
	playerList[_player].startPos = _pos;
	if (playerList[_player].steamID == steamID) character = _inst;
}

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