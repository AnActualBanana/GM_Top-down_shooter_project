/// @description detection bar

draw_self();
draw_sprite_stretched(Spr_detection_bar, 0,  detection_bar_x, detection_bar_y, (detection_total_threshold/detection_total_max) * detection_bar_width, detection_bar_height);
draw_sprite(Spr_detection_bar_frame, 0, detection_bar_x, detection_bar_y);

