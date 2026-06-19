// Step Event
if (instance_exists(character))
{
    // How far ahead to look in movement direction
    var _moveOffsetX = character.xInput * 35;
    var _moveOffsetY = character.yInput * 35;
    
    // How far toward the cursor to look
    var _mouseOffsetX = (mouse_x - camera_get_view_x(cam) - 640/2) * 0.15;
    var _mouseOffsetY = (mouse_y - camera_get_view_y(cam) - 360/2) * (0.15*YSCALE);
    
    // Combine all three: player center + movement ahead + cursor pull
    var _targetX = character.x - 640/2 + _moveOffsetX + _mouseOffsetX;
    var _targetY = character.y - 360/2 + _moveOffsetY + _mouseOffsetY;
    
    // Smooth lerp toward target
    x = lerp(x, _targetX, 0.1);
    y = lerp(y, _targetY, 0.1);
    
    camera_set_view_pos(cam, x, y);
}