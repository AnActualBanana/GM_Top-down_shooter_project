function get_inputs (player) {
if instance_exists (Obj_player) {
keyboard_down = false;
keyboard_up = false;
keyboard_right = false;
keyboard_left = false;
keyboard_lshift = false;
keyboard_lctrl = false;
keyboard_space = false;
keyboard_r = false;
left_mouse_button = false;
}
if keyboard_check(ord("S")) {
	keyboard_down = true;
}
if keyboard_check(ord("W")) {
	keyboard_up = true;
}
if keyboard_check(ord("D")) {
	keyboard_right = true;
}
if keyboard_check(ord("A")) {
	keyboard_left = true;
}
if keyboard_check(vk_lshift) {
	keyboard_lshift = true;
}
if keyboard_check(vk_lcontrol) {
	keyboard_lctrl = true;
}
if keyboard_check(vk_space) {
	keyboard_space = true;
}
if keyboard_check(ord("R")) {
	keyboard_r = true;
}
if mouse_check_button_pressed(mb_left) {
	left_mouse_button = true;
}
else {
	left_mouse_button = false;
}
}