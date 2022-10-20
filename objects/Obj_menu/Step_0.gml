Scr_get_inputs();

if keyboard_check_pressed(ord("S")) and menu_index < 3 {menu_index++};
if keyboard_check_pressed(ord("W")) and menu_index > 0 {menu_index--};