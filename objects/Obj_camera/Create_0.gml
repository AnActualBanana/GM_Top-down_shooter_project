//camera view
View_width = 1920/2
View_height = 1080/2

Window_scale = 2;

window_set_size(View_width*Window_scale, View_height*Window_scale);
alarm[0] = 1;

surface_resize(application_surface, View_width*Window_scale, View_height*Window_scale);