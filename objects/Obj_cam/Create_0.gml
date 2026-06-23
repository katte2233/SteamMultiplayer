cam = camera_create_view(0, 0, 640, 360); // width/height = your game resolution
view_enabled = true;
view_visible[0] = true;
view_camera[0] = cam;

target = undefined;

alarm[1] = 5; //Initialize other stuff after we've been spawned