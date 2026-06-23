///@desc Sprite stacking

//Body
for(var _i = 0; _i < image_number-10; _i++)
{
	var _t = (_i / (image_number - 11))*1;
	draw_sprite_ext(sprite_index,_i,x,y-_i,image_xscale,image_yscale,bodyDir,merge_colour(c_white,c_white,_t),image_alpha);
}

//Cannon
for(var _i = 13; _i < image_number; _i++)
{
	var _t = ((_i-13) / (image_number - 14))*1;
	draw_sprite_ext(sprite_index,_i,x,y-_i,image_xscale,image_yscale,cannonDir,merge_colour(c_gray,c_white,_t),image_alpha);
}