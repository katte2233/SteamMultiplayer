/// @desc

//Flipping character depending on what side the mouse is on
var _column = column;

if((direction > 90)	&&	(direction < 270)) _column+=2;

//Draw sprite sheet
draw_sprite_part_ext(Spr_player,lobbyMemberID,64*frame,64*_column,64,64,x-32,y-42,image_xscale,image_yscale,image_blend,image_alpha);

//Nametag
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(Fon_playerNames);
draw_set_colour(c_black);

draw_text(x,y-27,steamName);
draw_text(x,y-35,instance_number(all));

//Debugging
//draw_point(x,y);