function blood_splatter(_x,_y,_dir,_dirSpread,_spdMin,_spdMax,_count)
{
	var _instBlood = instance_create_depth(_x,_y,DEPTH_SORT_MIN+200,Obj_particles);
	
	_instBlood.set_size(0.7,1);
	_instBlood.set_sprite(Spr_bloodSplatter, false, false, true);
	_instBlood.set_depth(DEPTH_SORT_MIN+200);
	_instBlood.set_blend(false);
			
	_instBlood.set_orientation(0,359);
	_instBlood.set_color_mix(c_red,make_colour_rgb(128,0,0));
	var _ran = random_range(0.6,1);
	_instBlood.set_alpha(_ran,_ran,0);
	_instBlood.set_direction(_dir-_dirSpread,_dir+_dirSpread);
	_instBlood.set_speed(_spdMin,_spdMax,-1);
	_instBlood.set_life(9999,9999);
			
	_instBlood.burst(_count);
}

function imprint_snow(_target)
{
	var _imprints = [];
	
	//Can be optimized with the stream function instead of burst
	var _ran = irandom(2);
	
    for (var _i = 0; _i < 3; _i++)
    {
        var _imp = instance_create_depth(_target.x, _target.y, 10 + _i, Obj_particles);
        _imp.set_size(1, 1);
        _imp.set_orientation(0, 0);
        _imp.set_sprite(Spr_snowImprint, false, false, false);
        _imp.set_image_index(_ran + _i * 3);
        _imp.set_depth(10 + _i);
        _imp.set_speed(0, 0);
        _imp.set_blend(false);
        _imp.set_life(1200, 1200);
		_imp.set_alpha(1,1,0);
		_imp.set_target(_target);
		
		array_push(_imprints, _imp);
    }
	
	return _imprints;
}

function rain_snow(_x, _y, _width, _height, _intensity, _dir)
{
    var _rain = instance_create_depth(_x, _y, -10, Obj_particles);
	
    _rain.set_size(0.3, 0.8);
    _rain.set_orientation(0, irandom(359));
	_rain.set_direction(270+_dir-5,270+_dir+5);
    _rain.set_sprite(Spr_rainSnow, false, false, true);
    _rain.set_depth(-10);
    _rain.set_speed(clamp(_intensity*0.5-.5,.5,5), clamp(_intensity*0.5,1,6));
    _rain.set_blend(false);
    _rain.set_life(300, 300);
	var _ran = random_range(0.6,1);
	_rain.set_alpha(_ran,_ran,0);
	
	part_emitter_region(_rain.ps, _rain.pe, _x, _x+_width, _y, _y+_height, ps_shape_rectangle, ps_distr_linear);
    _rain.stream(_intensity);
}

function menu_imprint_snow(_target)
{
	//Can be optimized with the stream function instead of burst
	var _ran = irandom(2);
	
    for (var _i = 0; _i < 3; _i++)
    {
        var _imp = instance_create_depth(_target.x, _target.y, 10 + _i, Obj_particles);
        _imp.set_size(1, 1);
        _imp.set_orientation(0, 0);
        _imp.set_sprite(Spr_snowImprint, false, false, false);
        _imp.set_image_index(_ran + _i * 3);
        _imp.set_depth(10 + _i);
        _imp.set_direction(180, 180);
        _imp.set_speed(1, 1);
        _imp.set_blend(false);
        _imp.set_life(500, 500);
        _imp.set_alpha(1, 1, 0);
        _imp.burst(1);
    }
}