// Create event of manager
snow_surfaces = array_create(3);
snow_surfaces[0] = surface_create(room_width, room_height);
snow_surfaces[1] = surface_create(room_width, room_height);
snow_surfaces[2] = surface_create(room_width, room_height);

function imprint_snow(_x, _y)
{
    for (var _i = 0; _i < 3; _i++)
    {
        if (!surface_exists(snow_surfaces[_i]))
            snow_surfaces[_i] = surface_create(room_width, room_height);
            
        surface_set_target(snow_surfaces[_i]);
        draw_sprite(Spr_snowImprint, 2 - _i, _x, _y); // specific frame per layer
        surface_reset_target();
    }
}