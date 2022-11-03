/// @description detection bar

draw_self();
draw_sprite_stretched(Spr_detection_bar, 0,  detection_bar_x, detection_bar_y, (detection_total_threshold/detection_total_max) * detection_bar_width, detection_bar_height);
draw_sprite(Spr_detection_bar_frame, 0, detection_bar_x, detection_bar_y);


draw_sprite_ext(Spr_detection_line, 0,  x + lengthdir_x(25, detection_cone_direction + detection_cone_width), y + lengthdir_y(25, detection_cone_direction + detection_cone_width), 10, 1, detection_cone_direction + detection_cone_width, c_white, 0.5);
draw_sprite_ext(Spr_detection_line, 0,  x + lengthdir_x(25, detection_cone_direction - detection_cone_width), y + lengthdir_y(25, detection_cone_direction - detection_cone_width), 10, 1, detection_cone_direction - detection_cone_width, c_white, 0.5);
