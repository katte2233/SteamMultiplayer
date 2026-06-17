///@desc Steam update

steam_update();

//Restart game
if(keyboard_check_pressed(ord("R")))
{
	isGameRestarting = true;
	game_restart();
}