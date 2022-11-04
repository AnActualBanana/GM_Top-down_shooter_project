if instance_exists (Obj_player) {keyboard_down = false;
keyboard_up = false;
keyboard_right = false;
keyboard_left = false;
keyboard_lshift = false;
keyboard_lctrl = false;
keyboard_space = false;
keyboard_r = false;
left_mouse_button = false;

var _input = rollback_get_input();
if (_input.left) {
	keyboard_left = true;
}
if (_input.right) {
	keyboard_right = true;
}
if (_input.down) {
	keyboard_down = true;
}
if (_input.up) {
	keyboard_up = true;
}
if (_input.r) {
	keyboard_r = true;
}
if (_input.lshift) {
	keyboard_lshift = true;
}
if (_input.lctrl) {
	keyboard_lctrl = true;
}
if (_input.space) {
	keyboard_space = true;
}
if (_input.lclick) {
	left_mouse_button = true;
}
//converts inputs into variables
}