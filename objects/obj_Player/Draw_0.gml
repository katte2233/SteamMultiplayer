/// @desc
draw_self()

// If paddle is hit by bullet
if (moveSpeed < 5)
{
	draw_set_color(c_white);;
	draw_set_alpha(1-moveSpeed/5);
	draw_rectangle(bbox_left,bbox_top,bbox_right-1,bbox_bottom-1,false);
}
draw_set_alpha(1);

var _depth = depth;

//Nametag
depth = 0;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x,y-36,steamName);
draw_text(x,y,points);

depth = _depth;