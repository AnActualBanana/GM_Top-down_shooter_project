var i = 0;
draw_set_font(font_main);
draw_set_halign(fa_center);
draw_set_color(c_ltgray);
//displays some version info to the screen
draw_text(x, (y - 200), "Pre-Alpha Version 0.7.7")
draw_text(x, (y - 160), string("Single player!!"))
draw_text(x, (y - 100), string("High Score: " + string(global.highest_score)))

//creates menu buttons
repeat(buttons) {
	draw_set_color(c_ltgray);
	if (menu_index == i) draw_set_color(c_red);
	draw_text(menu_x, menu_y + button_h * i, button[i]);
	i++;
}