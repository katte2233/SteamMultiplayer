///@desc Spawn Players

var _playerLayer = layer_get_id("Instances")

for (var _player = 0; _player < array_length(playerList); _player++)
{
	var _pos = grab_spawn_point(_player);
	var _inst = instance_create_layer(_pos.x,_pos.y,_playerLayer,Obj_player,
		{
			steamName	: playerList[_player].steamName,
			steamID		: playerList[_player].steamID,
			lobbyMemberID: _player
		});
	playerList[_player].character = _inst;
	playerList[_player].startPos = _pos;
	if (playerList[_player].steamID == steamID)
	{
		character = _inst;
		
		// Create camera for host
        var _cam = instance_create_layer(_pos.x, _pos.y, _playerLayer, Obj_cam);
        _cam.character = _inst;
	}
}

alarm[0] = 5;