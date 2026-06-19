// Step Event
if (instance_exists(character))
{
    var _x = character.x - 640/2;
    var _y = character.y - 360/2;
    
    // Clamp to room boundaries
    //_x = clamp(_x, 0, room_width - 480);
    //_y = clamp(_y, 0, room_height - 270);
    
    camera_set_view_pos(cam, _x, _y);
}

show_debug_message("Spawned Cam");