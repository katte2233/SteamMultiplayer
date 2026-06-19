/// @desc
//Draw sprite sheet
draw_sprite_part(Spr_player,image_index,64*frame,64*column,64,64,x-32,y-42);

//Nametag
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(Fon_playerNames);
draw_set_colour(c_black);

draw_text(x,y-27,steamName);

//Debugging
//draw_point(x,y);